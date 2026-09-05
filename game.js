// Flight Simulator - Made By Manav
// Enhanced multiplayer flight simulator with real-world map

const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

// Game state
const gameState = {
    // Aircraft physics
    position: { x: 0, y: 0, z: 100 }, // Starting in the air to fix landing issues
    velocity: { x: 0, y: 0, z: 0 },
    rotation: { pitch: 0, roll: 0, yaw: 0 },
    angularVelocity: { pitch: 0, roll: 0, yaw: 0 },
    
    // Flight controls
    throttle: 0,
    maxSpeed: 800,
    acceleration: 0.5,
    drag: 0.98,
    liftCoefficient: 0.02,
    gravity: 0.1,
    
    // Aircraft state
    altitude: 100,
    speed: 0,
    heading: 0,
    verticalSpeed: 0,
    fuel: 100,
    isFlying: false,
    landingGear: true,
    
    // Camera
    cameraMode: 0, // 0: chase, 1: cockpit, 2: top-down
    cameraDistance: 50,
    cameraHeight: 20,
    
    // Multiplayer
    playerId: 'player_' + Math.random().toString(36).substr(2, 9),
    playerName: 'Pilot_' + Math.floor(Math.random() * 1000),
    players: {},
    
    // World
    cities: [],
    buildings: [],
    groundLevel: 0,
    
    // Map
    map: null,
    playerMarker: null,
    playerMarkers: {},
    
    // Real-world location (default: Dubai)
    currentLocation: { lat: 25.2048, lng: 55.2708 },
    
    // Input state
    keys: {},
    
    // Game status
    crashed: false,
    score: 0
};

// City data for generation
const cityTemplates = [
    { name: 'Dubai', lat: 25.2048, lng: 55.2708, buildings: 500 },
    { name: 'New York', lat: 40.7128, lng: -74.0060, buildings: 800 },
    { name: 'London', lat: 51.5074, lng: -0.1278, buildings: 600 },
    { name: 'Tokyo', lat: 35.6762, lng: 139.6503, buildings: 900 },
    { name: 'Paris', lat: 48.8566, lng: 2.3522, buildings: 500 },
    { name: 'Singapore', lat: 1.3521, lng: 103.8198, buildings: 700 },
    { name: 'Sydney', lat: -33.8688, lng: 151.2093, buildings: 400 },
    { name: 'Mumbai', lat: 19.0760, lng: 72.8777, buildings: 650 }
];

// Resize canvas
function resizeCanvas() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
}

window.addEventListener('resize', resizeCanvas);
resizeCanvas();

// Initialize Leaflet map
function initMap() {
    gameState.map = L.map('minimap', {
        center: [gameState.currentLocation.lat, gameState.currentLocation.lng],
        zoom: 12,
        zoomControl: false,
        attributionControl: false
    });

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19
    }).addTo(gameState.map);

    // Player marker
    gameState.playerMarker = L.marker([gameState.currentLocation.lat, gameState.currentLocation.lng]).addTo(gameState.map);
    
    // Update location display
    updateLocationDisplay();
}

// Generate cities and buildings
function generateWorld() {
    gameState.cities = [];
    gameState.buildings = [];
    
    // Add major cities
    cityTemplates.forEach(city => {
        gameState.cities.push({
            name: city.name,
            lat: city.lat,
            lng: city.lng,
            buildingCount: city.buildings,
            generated: false
        });
    });
    
    // Generate buildings around starting location
    generateBuildings(gameState.currentLocation.lat, gameState.currentLocation.lng, 200);
}

function generateBuildings(lat, lng, count) {
    const buildings = [];
    
    for (let i = 0; i < count; i++) {
        const angle = Math.random() * Math.PI * 2;
        const distance = Math.random() * 5000;
        const buildingLat = lat + (Math.cos(angle) * distance / 111000);
        const buildingLng = lng + (Math.sin(angle) * distance / (111000 * Math.cos(lat * Math.PI / 180)));
        
        buildings.push({
            lat: buildingLat,
            lng: buildingLng,
            height: 20 + Math.random() * 150,
            width: 10 + Math.random() * 30,
            depth: 10 + Math.random() * 30,
            color: `hsl(${200 + Math.random() * 40}, ${20 + Math.random() * 20}%, ${30 + Math.random() * 40}%)`
        });
    }
    
    gameState.buildings = buildings;
}

// Input handling
document.addEventListener('keydown', (e) => {
    gameState.keys[e.key.toLowerCase()] = true;
    gameState.keys[e.code] = true;
    
    if (e.key.toLowerCase() === 'c') {
        gameState.cameraMode = (gameState.cameraMode + 1) % 3;
    }
    
    if (e.key.toLowerCase() === 'l') {
        gameState.landingGear = !gameState.landingGear;
        showMessage('Landing Gear', gameState.landingGear ? 'DOWN' : 'UP');
    }
    
    if (e.key.toLowerCase() === 'r') {
        resetAircraft();
    }
});

document.addEventListener('keyup', (e) => {
    gameState.keys[e.key.toLowerCase()] = false;
    gameState.keys[e.code] = false;
});

// Reset aircraft position
function resetAircraft() {
    gameState.position = { x: 0, y: 0, z: 500 };
    gameState.velocity = { x: 0, y: 0, z: 0 };
    gameState.rotation = { pitch: 0, roll: 0, yaw: 0 };
    gameState.angularVelocity = { pitch: 0, roll: 0, yaw: 0 };
    gameState.throttle = 0;
    gameState.speed = 0;
    gameState.crashed = false;
    gameState.fuel = 100;
    showMessage('Reset', 'Aircraft position reset');
}

// Physics update
function updatePhysics() {
    if (gameState.crashed) return;
    
    const dt = 0.016; // Delta time (approx 60fps)
    
    // Throttle control
    if (gameState.keys['shift'] || gameState.keys['Shift']) {
        gameState.throttle = Math.min(gameState.throttle + 0.5, 100);
    }
    if (gameState.keys['control'] || gameState.keys['Control']) {
        gameState.throttle = Math.max(gameState.throttle - 0.5, 0);
    }
    
    // Pitch control (inverted for flight sim feel)
    if (gameState.keys['w'] || gameState.keys['arrowup']) {
        gameState.angularVelocity.pitch = -0.03;
    } else if (gameState.keys['s'] || gameState.keys['arrowdown']) {
        gameState.angularVelocity.pitch = 0.03;
    } else {
        gameState.angularVelocity.pitch *= 0.95;
    }
    
    // Roll control
    if (gameState.keys['a'] || gameState.keys['arrowleft']) {
        gameState.angularVelocity.roll = -0.03;
    } else if (gameState.keys['d'] || gameState.keys['arrowright']) {
        gameState.angularVelocity.roll = 0.03;
    } else {
        gameState.angularVelocity.roll *= 0.95;
    }
    
    // Yaw control
    if (gameState.keys['q']) {
        gameState.angularVelocity.yaw = -0.02;
    } else if (gameState.keys['e']) {
        gameState.angularVelocity.yaw = 0.02;
    } else {
        gameState.angularVelocity.yaw *= 0.95;
    }
    
    // Brake
    if (gameState.keys[' ']) {
        gameState.velocity.x *= 0.95;
        gameState.velocity.z *= 0.95;
    }
    
    // Apply angular velocity to rotation
    gameState.rotation.pitch += gameState.angularVelocity.pitch;
    gameState.rotation.roll += gameState.angularVelocity.roll;
    gameState.rotation.yaw += gameState.angularVelocity.yaw;
    
    // Limit pitch
    gameState.rotation.pitch = Math.max(-Math.PI/2, Math.min(Math.PI/2, gameState.rotation.pitch));
    
    // Calculate speed from throttle
    const targetSpeed = (gameState.throttle / 100) * gameState.maxSpeed;
    gameState.speed += (targetSpeed - gameState.speed) * gameState.acceleration * dt;
    
    // Apply drag
    gameState.speed *= gameState.drag;
    
    // Calculate velocity based on rotation and speed
    const speedRad = gameState.speed * 0.01;
    gameState.velocity.x = Math.sin(gameState.rotation.yaw) * speedRad * Math.cos(gameState.rotation.pitch);
    gameState.velocity.z = Math.cos(gameState.rotation.yaw) * speedRad * Math.cos(gameState.rotation.pitch);
    
    // Lift calculation - improved landing physics
    const lift = gameState.speed * gameState.liftCoefficient * Math.cos(gameState.rotation.pitch);
    const gravityEffect = gameState.gravity * (1 - lift);
    
    gameState.velocity.y += gravityEffect;
    
    // Apply velocity to position
    gameState.position.x += gameState.velocity.x;
    gameState.position.y += gameState.velocity.y;
    gameState.position.z += gameState.velocity.z;
    
    // Ground collision detection with proper landing
    const groundY = gameState.groundLevel;
    
    if (gameState.position.y <= groundY) {
        // Check if landing is safe
        const verticalSpeed = Math.abs(gameState.velocity.y);
        const horizontalSpeed = gameState.speed;
        const isGearDown = gameState.landingGear;
        
        if (verticalSpeed > 5 || (horizontalSpeed > 100 && !isGearDown)) {
            // Crash landing
            crashAircraft();
        } else {
            // Safe landing
            gameState.position.y = groundY;
            gameState.velocity.y = 0;
            
            // Ground friction
            gameState.velocity.x *= 0.98;
            gameState.velocity.z *= 0.98;
            gameState.speed *= 0.98;
            
            // Auto-level on ground
            gameState.rotation.pitch *= 0.9;
            gameState.rotation.roll *= 0.9;
            
            if (gameState.isFlying && horizontalSpeed < 10) {
                gameState.isFlying = false;
                showMessage('Landed', 'Safe landing!');
            }
        }
    } else {
        gameState.isFlying = gameState.position.y > groundY + 5;
    }
    
    // Update altitude (convert to feet)
    gameState.altitude = Math.max(0, gameState.position.y * 10);
    gameState.verticalSpeed = gameState.velocity.y * 100;
    gameState.heading = (gameState.rotation.yaw * 180 / Math.PI + 360) % 360;
    
    // Fuel consumption
    if (gameState.throttle > 0) {
        gameState.fuel = Math.max(0, gameState.fuel - gameState.throttle * 0.001);
    }
    
    // Update location based on position
    updateRealWorldLocation();
}

// Crash handling
function crashAircraft() {
    gameState.crashed = true;
    gameState.velocity = { x: 0, y: 0, z: 0 };
    showMessage('CRASH!', 'Aircraft destroyed. Press R to restart.');
}

// Update real-world location based on virtual position
function updateRealWorldLocation() {
    // Convert virtual position to lat/lng offset
    const latOffset = gameState.position.x / 111000;
    const lngOffset = gameState.position.z / (111000 * Math.cos(gameState.currentLocation.lat * Math.PI / 180));
    
    const newLat = gameState.currentLocation.lat + latOffset;
    const newLng = gameState.currentLocation.lng + lngOffset;
    
    // Update player marker on map
    if (gameState.playerMarker) {
        gameState.playerMarker.setLatLng([newLat, newLng]);
    }
    
    // Update map center to follow player
    if (gameState.map) {
        gameState.map.panTo([newLat, newLng], { animate: true, duration: 0.5 });
    }
}

// Update location display
function updateLocationDisplay() {
    fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${gameState.currentLocation.lat}&lon=${gameState.currentLocation.lng}`)
        .then(response => response.json())
        .then(data => {
            const location = data.display_name || 'Unknown Location';
            document.getElementById('location').textContent = location.split(',')[0] || 'Flying';
        })
        .catch(() => {
            document.getElementById('location').textContent = 'Airspace';
        });
}

// Simulate multiplayer (in a real implementation, this would use WebSockets)
function simulateMultiplayer() {
    // Create simulated players
    if (Object.keys(gameState.players).length === 0) {
        for (let i = 0; i < 5; i++) {
            const playerId = 'player_' + i;
            gameState.players[playerId] = {
                id: playerId,
                name: 'Pilot_' + Math.floor(Math.random() * 1000),
                lat: gameState.currentLocation.lat + (Math.random() - 0.5) * 0.1,
                lng: gameState.currentLocation.lng + (Math.random() - 0.5) * 0.1,
                altitude: Math.random() * 10000,
                speed: 200 + Math.random() * 400,
                heading: Math.random() * 360
            };
        }
    }
    
    // Update simulated players
    Object.keys(gameState.players).forEach(playerId => {
        const player = gameState.players[playerId];
        
        // Random movement
        player.lat += (Math.random() - 0.5) * 0.001;
        player.lng += (Math.random() - 0.5) * 0.001;
        player.altitude += (Math.random() - 0.5) * 50;
        
        // Update or create marker
        if (!gameState.playerMarkers[playerId]) {
            const icon = L.divIcon({
                className: 'player-icon',
                html: `<div style="background: ${playerId === gameState.playerId ? '#00ff88' : '#ff4444'}; width: 12px; height: 12px; border-radius: 50%; border: 2px solid white;"></div>`,
                iconSize: [12, 12]
            });
            
            gameState.playerMarkers[playerId] = L.marker([player.lat, player.lng], { icon: icon })
                .addTo(gameState.map)
                .bindPopup(`${player.name}<br>Alt: ${Math.round(player.altitude)} ft<br>Speed: ${Math.round(player.speed)} km/h`);
        } else {
            gameState.playerMarkers[playerId].setLatLng([player.lat, player.lng]);
        }
    });
    
    // Update player list UI
    updatePlayerList();
}

function updatePlayerList() {
    const container = document.getElementById('players');
    let html = '';
    
    Object.values(gameState.players).forEach(player => {
        const isSelf = player.id === gameState.playerId;
        html += `
            <div class="player-entry">
                <span>${isSelf ? '🛩️' : '✈️'} ${player.name}${isSelf ? ' (You)' : ''}</span>
                <span class="${player.altitude > 1000 ? 'status-good' : 'status-warning'}">${Math.round(player.altitude)}ft</span>
            </div>
        `;
    });
    
    container.innerHTML = html;
}

// 3D Rendering
function render() {
    ctx.fillStyle = '#1a1a2e';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    // Sky gradient
    const skyGradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
    skyGradient.addColorStop(0, '#0a0a1a');
    skyGradient.addColorStop(0.5, '#1a2a4a');
    skyGradient.addColorStop(1, '#2a4a6a');
    ctx.fillStyle = skyGradient;
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    // Draw horizon
    const horizonY = canvas.height / 2 + gameState.rotation.pitch * 200;
    ctx.strokeStyle = '#4a6a8a';
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.moveTo(0, horizonY);
    ctx.lineTo(canvas.width, horizonY);
    ctx.stroke();
    
    // Draw ground
    const groundGradient = ctx.createLinearGradient(0, horizonY, 0, canvas.height);
    groundGradient.addColorStop(0, '#2a5a3a');
    groundGradient.addColorStop(1, '#1a3a2a');
    ctx.fillStyle = groundGradient;
    ctx.fillRect(0, horizonY, canvas.width, canvas.height - horizonY);
    
    // Draw buildings (simple 3D projection)
    drawBuildings(horizonY);
    
    // Draw aircraft indicator
    drawAircraftIndicator();
    
    // Draw crosshair
    drawCrosshair();
    
    // Draw speed and altitude indicators
    drawIndicators();
}

function drawBuildings(horizonY) {
    // Sort buildings by distance for proper rendering
    const sortedBuildings = [...gameState.buildings].sort((a, b) => {
        const distA = Math.sqrt(Math.pow(a.lat - gameState.currentLocation.lat, 2) + Math.pow(a.lng - gameState.currentLocation.lng, 2));
        const distB = Math.sqrt(Math.pow(b.lat - gameState.currentLocation.lat, 2) + Math.pow(b.lng - gameState.currentLocation.lng, 2));
        return distB - distA;
    });
    
    // Draw only visible buildings
    sortedBuildings.slice(0, 50).forEach(building => {
        const dx = (building.lng - gameState.currentLocation.lng) * 10000;
        const dy = (building.lat - gameState.currentLocation.lat) * 10000;
        
        // Simple perspective projection
        const scale = 500 / (500 + Math.sqrt(dx*dx + dy*dy));
        const screenX = canvas.width / 2 + dx * scale * 100;
        const screenY = horizonY - dy * scale * 100;
        
        if (scale > 0.01) {
            const height = building.height * scale;
            const width = building.width * scale;
            
            ctx.fillStyle = building.color;
            ctx.fillRect(screenX - width/2, screenY - height, width, height);
            
            // Building outline
            ctx.strokeStyle = 'rgba(0, 0, 0, 0.3)';
            ctx.lineWidth = 1;
            ctx.strokeRect(screenX - width/2, screenY - height, width, height);
        }
    });
}

function drawAircraftIndicator() {
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    
    ctx.save();
    ctx.translate(centerX, centerY);
    ctx.rotate(-gameState.rotation.roll);
    
    // Aircraft body
    ctx.fillStyle = '#00ff88';
    ctx.beginPath();
    ctx.moveTo(0, -30);
    ctx.lineTo(-20, 20);
    ctx.lineTo(0, 10);
    ctx.lineTo(20, 20);
    ctx.closePath();
    ctx.fill();
    
    // Wings
    ctx.fillStyle = '#00cc66';
    ctx.beginPath();
    ctx.moveTo(-40, 0);
    ctx.lineTo(40, 0);
    ctx.lineTo(45, 5);
    ctx.lineTo(-45, 5);
    ctx.closePath();
    ctx.fill();
    
    // Landing gear indicator
    if (gameState.landingGear) {
        ctx.fillStyle = '#ffff00';
        ctx.beginPath();
        ctx.arc(-15, 15, 3, 0, Math.PI * 2);
        ctx.arc(15, 15, 3, 0, Math.PI * 2);
        ctx.fill();
    }
    
    ctx.restore();
}

function drawCrosshair() {
    ctx.strokeStyle = 'rgba(0, 255, 136, 0.5)';
    ctx.lineWidth = 2;
    
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    
    ctx.beginPath();
    ctx.arc(centerX, centerY, 50, 0, Math.PI * 2);
    ctx.moveTo(centerX - 60, centerY);
    ctx.lineTo(centerX - 40, centerY);
    ctx.moveTo(centerX + 40, centerY);
    ctx.lineTo(centerX + 60, centerY);
    ctx.moveTo(centerX, centerY - 60);
    ctx.lineTo(centerX, centerY - 40);
    ctx.moveTo(centerX, centerY + 40);
    ctx.lineTo(centerX, centerY + 60);
    ctx.stroke();
}

function drawIndicators() {
    // Update dashboard
    document.getElementById('speed').textContent = Math.round(gameState.speed);
    document.getElementById('altitude').textContent = Math.round(gameState.altitude);
    document.getElementById('heading').textContent = Math.round(gameState.heading);
    document.getElementById('throttle').textContent = Math.round(gameState.throttle);
    document.getElementById('vspeed').textContent = Math.round(gameState.verticalSpeed * 10);
    document.getElementById('fuel').textContent = Math.round(gameState.fuel);
    
    const statusEl = document.getElementById('flightStatus');
    if (gameState.crashed) {
        statusEl.textContent = 'CRASHED';
        statusEl.className = 'dash-value status-bad';
    } else if (gameState.isFlying) {
        statusEl.textContent = 'In Flight';
        statusEl.className = 'dash-value status-good';
    } else {
        statusEl.textContent = 'Grounded';
        statusEl.className = 'dash-value status-warning';
    }
    
    // Update visual indicators
    const altBar = document.getElementById('altitudeBar');
    const maxAlt = 10000;
    const altPercent = Math.min(100, (gameState.altitude / maxAlt) * 100);
    altBar.style.height = altPercent + '%';
    
    const speedBar = document.getElementById('speedBar');
    const maxSpeed = gameState.maxSpeed;
    const speedPercent = Math.min(100, (gameState.speed / maxSpeed) * 100);
    speedBar.style.width = speedPercent + '%';
}

function showMessage(title, text) {
    const msgDiv = document.getElementById('message');
    document.getElementById('msgTitle').textContent = title;
    document.getElementById('msgText').textContent = text;
    msgDiv.style.display = 'block';
    
    setTimeout(() => {
        msgDiv.style.display = 'none';
    }, 3000);
}

// Main game loop
function gameLoop() {
    updatePhysics();
    simulateMultiplayer();
    render();
    requestAnimationFrame(gameLoop);
}

// Initialize game
function init() {
    console.log('Flight Simulator - Made By Manav');
    console.log('Initializing...');
    
    initMap();
    generateWorld();
    resetAircraft();
    
    showMessage('Welcome!', 'Flight Simulator by Manav\nUse controls to fly. Enjoy!');
    
    // Start game loop
    gameLoop();
}

// Start when page loads
window.addEventListener('load', init);

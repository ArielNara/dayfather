<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Te Amo Padre - Día del Padre</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;0,800;1,400&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 30%, #667eea 60%, #764ba2 100%);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        /* Fondo animado mejorado */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background:
                    radial-gradient(circle at 10% 20%, rgba(255, 200, 50, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 90% 80%, rgba(30, 144, 255, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 50% 50%, rgba(255, 255, 255, 0.05) 0%, transparent 70%);
            pointer-events: none;
            animation: backgroundPulse 8s ease-in-out infinite;
        }

        @keyframes backgroundPulse {
            0%, 100% { opacity: 0.8; }
            50% { opacity: 1; }
        }

        /* Partículas animadas */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 12s ease-in-out infinite;
        }

        .particle:nth-child(1) { width: 4px; height: 4px; top: 10%; left: 15%; animation-delay: 0s; }
        .particle:nth-child(2) { width: 6px; height: 6px; top: 70%; left: 25%; animation-delay: 2s; }
        .particle:nth-child(3) { width: 8px; height: 8px; top: 30%; left: 80%; animation-delay: 4s; }
        .particle:nth-child(4) { width: 3px; height: 3px; top: 90%; left: 70%; animation-delay: 6s; }
        .particle:nth-child(5) { width: 5px; height: 5px; top: 50%; left: 5%; animation-delay: 8s; }
        .particle:nth-child(6) { width: 7px; height: 7px; top: 20%; left: 60%; animation-delay: 10s; }

        @keyframes float {
            0%, 100% { transform: translateY(0px) translateX(0px) rotate(0deg); opacity: 0.4; }
            25% { transform: translateY(-30px) translateX(10px) rotate(90deg); opacity: 0.8; }
            50% { transform: translateY(-60px) translateX(-10px) rotate(180deg); opacity: 1; }
            75% { transform: translateY(-30px) translateX(15px) rotate(270deg); opacity: 0.8; }
        }

        /* Header principal */
        .hero-section {
            position: relative;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            z-index: 10;
        }

        /* Título principal con animación 3D */
        .main-title {
            font-size: clamp(2.5rem, 8vw, 6rem);
            font-weight: 800;
            background: linear-gradient(45deg, #ffd700, #ffed4e, #fff, #ffd700);
            background-size: 400% 400%;
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 30px rgba(255, 215, 0, 0.5);
            margin-bottom: 30px;
            opacity: 0;
            transform: perspective(500px) rotateY(-45deg) translateZ(-100px);
            animation: title3D 3s ease-out 0.5s forwards, titleGlow 4s ease-in-out infinite;
        }

        @keyframes title3D {
            0% { opacity: 0; transform: perspective(500px) rotateY(-45deg) translateZ(-100px); }
            100% { opacity: 1; transform: perspective(500px) rotateY(0deg) translateZ(0px); }
        }

        @keyframes titleGlow {
            0%, 100% { background-position: 0% 50%; filter: brightness(1) drop-shadow(0 0 20px rgba(255, 215, 0, 0.3)); }
            50% { background-position: 100% 50%; filter: brightness(1.3) drop-shadow(0 0 40px rgba(255, 215, 0, 0.6)); }
        }

        /* Subtítulo con efecto typewriter */
        .subtitle {
            font-size: clamp(1.2rem, 4vw, 2rem);
            color: #f8f9fa;
            margin-bottom: 50px;
            font-weight: 300;
            opacity: 0;
            animation: slideInFromBottom 2s ease-out 1.5s forwards;
            position: relative;
        }

        .typewriter {
            overflow: hidden;
            border-right: 3px solid #ffd700;
            animation: typing 3s steps(40, end) 2s, blink-caret 1s step-end infinite 2s;
            white-space: nowrap;
        }

        @keyframes typing { from { width: 0; } to { width: 100%; } }
        @keyframes blink-caret { from, to { border-color: transparent; } 50% { border-color: #ffd700; } }
        @keyframes slideInFromBottom { 0% { opacity: 0; transform: translateY(50px); } 100% { opacity: 1; transform: translateY(0); } }

        /* Collage de fotos */
        .photo-collage {
            position: relative;
            max-width: 1200px;
            margin: 60px auto;
            padding: 0 20px;
            opacity: 0;
            animation: fadeInScale 2s ease-out 2.5s forwards;
        }

        .collage-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            perspective: 1000px;
        }

        .photo-frame {
            position: relative;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 15px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            transform-style: preserve-3d;
            transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            overflow: hidden;
        }

        .photo-frame:hover {
            transform: translateY(-15px) rotateX(5deg) rotateY(5deg);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        .photo-frame::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s;
        }

        .photo-frame:hover::before {
            left: 100%;
        }

        .photo-placeholder {
            width: 100%;
            height: 200px;
            background-size: cover;
            background-position: center;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.1rem;
            text-align: center;
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .photo-placeholder span {
            position: absolute;
            z-index: 1;
        }

        .photo-placeholder::after {
            content: '📷';
            font-size: 3rem;
            opacity: 0.3;
            position: absolute;
            animation: photoFloat 3s ease-in-out infinite;
        }

        @keyframes photoFloat {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
        }

        .photo-caption {
            margin-top: 15px;
            color: white;
            font-size: 0.9rem;
            text-align: center;
            font-weight: 400;
        }

        /* Diferentes estilos para cada frame */
        .photo-frame:nth-child(1) { animation-delay: 2.7s; transform: rotate(-2deg); }
        .photo-frame:nth-child(2) { animation-delay: 2.9s; transform: rotate(1deg); }
        .photo-frame:nth-child(3) { animation-delay: 3.1s; transform: rotate(-1deg); }
        .photo-frame:nth-child(4) { animation-delay: 3.3s; transform: rotate(2deg); }
        .photo-frame:nth-child(5) { animation-delay: 3.5s; transform: rotate(-1.5deg); }
        .photo-frame:nth-child(6) { animation-delay: 3.7s; transform: rotate(0.5deg); }

        @keyframes fadeInScale {
            0% { opacity: 0; transform: scale(0.8) translateY(50px); }
            100% { opacity: 1; transform: scale(1) translateY(0); }
        }

        /* Mensaje especial con animación */
        .special-message {
            max-width: 800px;
            margin: 80px auto;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border-radius: 30px;
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
            opacity: 0;
            animation: messageSlideIn 2s ease-out 3.5s forwards;
            position: relative;
            overflow: hidden;
        }

        .special-message::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, #ffd700, #ffed4e, #ffd700);
            background-size: 200% 100%;
            animation: shimmer 3s ease-in-out infinite;
        }

        @keyframes shimmer { 0%, 100% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } }
        @keyframes messageSlideIn { 0% { opacity: 0; transform: translateX(-100px) rotateY(-20deg); } 100% { opacity: 1; transform: translateX(0) rotateY(0deg); } }

        .message-text {
            font-size: clamp(1.1rem, 3vw, 1.4rem);
            color: white;
            line-height: 1.8;
            text-align: center;
            margin-bottom: 25px;
        }

        .message-text:last-child {
            margin-bottom: 0;
            font-weight: 600;
            color: #ffd700;
        }

        /* Flor azul mejorada */
        .flower-container {
            position: absolute;
            top: 10%;
            right: 5%;
            z-index: 5;
            opacity: 0;
            animation: flowerGrow 3s ease-out 4s forwards;
        }

        .flower {
            position: relative;
            width: 140px;
            height: 140px;
            animation: flowerSway 6s ease-in-out infinite;
        }

        .petal {
            position: absolute;
            width: 35px;
            height: 70px;
            background: linear-gradient(45deg, #4169E1, #87CEEB, #1E90FF, #4169E1);
            background-size: 200% 200%;
            border-radius: 50% 50% 50% 50% / 80% 80% 20% 20%;
            transform-origin: 50% 90%;
            box-shadow: 0 0 20px rgba(65, 105, 225, 0.4);
            animation: petalPulse 4s ease-in-out infinite, petalShine 3s ease-in-out infinite;
        }

        .petal:nth-child(1) { top: 5px; left: 52px; transform: rotate(0deg); animation-delay: 0s; }
        .petal:nth-child(2) { top: 20px; left: 80px; transform: rotate(45deg); animation-delay: 0.2s; }
        .petal:nth-child(3) { top: 50px; left: 88px; transform: rotate(90deg); animation-delay: 0.4s; }
        .petal:nth-child(4) { top: 80px; left: 80px; transform: rotate(135deg); animation-delay: 0.6s; }
        .petal:nth-child(5) { top: 95px; left: 52px; transform: rotate(180deg); animation-delay: 0.8s; }
        .petal:nth-child(6) { top: 80px; left: 25px; transform: rotate(225deg); animation-delay: 1s; }
        .petal:nth-child(7) { top: 50px; left: 17px; transform: rotate(270deg); animation-delay: 1.2s; }
        .petal:nth-child(8) { top: 20px; left: 25px; transform: rotate(315deg); animation-delay: 1.4s; }

        @keyframes petalShine { 0%, 100% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } }
        .flower-center {
            position: absolute;
            top: 52px;
            left: 52px;
            width: 36px;
            height: 36px;
            background: radial-gradient(circle, #FFD700, #FFA500, #FF8C00);
            border-radius: 50%;
            box-shadow: 0 0 25px rgba(255, 215, 0, 0.8);
            animation: centerGlow 2s ease-in-out infinite alternate;
        }

        @keyframes flowerGrow { 0% { opacity: 0; transform: scale(0) translateY(100px) rotate(-180deg); } 100% { opacity: 1; transform: scale(1) translateY(0) rotate(0deg); } }
        @keyframes flowerSway { 0%, 100% { transform: rotate(-3deg) translateX(-5px); } 50% { transform: rotate(3deg) translateX(5px); } }
        @keyframes petalPulse { 0%, 100% { transform: scale(1); filter: brightness(1); } 50% { transform: scale(1.15); filter: brightness(1.3); } }
        @keyframes centerGlow { 0% { box-shadow: 0 0 25px rgba(255, 215, 0, 0.8); transform: scale(1); } 100% { box-shadow: 0 0 40px rgba(255, 215, 0, 1); transform: scale(1.1); } }

        /* Botón interactivo mejorado */
        .action-button {
            background: linear-gradient(45deg, #ff6b6b, #ffd700, #ff6b6b, #4ecdc4);
            background-size: 300% 300%;
            border: none;
            padding: 20px 40px;
            border-radius: 60px;
            color: white;
            font-size: clamp(1.1rem, 3vw, 1.4rem);
            font-weight: 600;
            cursor: pointer;
            margin: 40px auto;
            display: block;
            opacity: 0;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.4s cubic-bezier(0.23, 1, 0.32, 1);
            animation: buttonBounceIn 2s ease-out 4.5s forwards, gradientShift 4s ease-in-out infinite;
            box-shadow: 0 10px 30px rgba(255, 107, 107, 0.4);
        }

        .action-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: left 0.6s;
        }

        .action-button:hover {
            transform: translateY(-8px) scale(1.05);
            box-shadow: 0 20px 50px rgba(255, 107, 107, 0.6);
        }

        .action-button:hover::before { left: 100%; }
        .action-button:active { transform: translateY(-5px) scale(1.02); }

        @keyframes buttonBounceIn {
            0% { opacity: 0; transform: scale(0.3) translateY(100px); }
            50% { opacity: 1; transform: scale(1.1) translateY(-10px); }
            70% { transform: scale(0.95) translateY(5px); }
            100% { opacity: 1; transform: scale(1) translateY(0); }
        }

        @keyframes gradientShift { 0%, 100% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } }

        /* Decoraciones mejoradas */
        .floating-decoration {
            position: absolute;
            font-size: clamp(1.5rem, 4vw, 3rem);
            opacity: 0.6;
            animation: decorationFloat 8s ease-in-out infinite;
            z-index: 3;
        }

        .floating-decoration:nth-child(1) { top: 15%; left: 10%; animation-delay: 0s; }
        .floating-decoration:nth-child(2) { top: 25%; right: 15%; animation-delay: 2s; }
        .floating-decoration:nth-child(3) { bottom: 30%; left: 8%; animation-delay: 4s; }
        .floating-decoration:nth-child(4) { bottom: 20%; right: 12%; animation-delay: 6s; }

        @keyframes decorationFloat {
            0%, 100% { transform: translateY(0px) rotate(0deg) scale(1); opacity: 0.6; }
            25% { transform: translateY(-20px) rotate(90deg) scale(1.1); opacity: 0.8; }
            50% { transform: translateY(-40px) rotate(180deg) scale(1.2); opacity: 1; }
            75% { transform: translateY(-20px) rotate(270deg) scale(1.1); opacity: 0.8; }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-section { padding: 10px; }
            .photo-collage { margin: 40px auto; }
            .collage-container { grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 15px; }
            .photo-placeholder { height: 150px; font-size: 0.9rem; }
            .special-message { margin: 40px auto; padding: 25px; }
            .flower-container { top: 5%; right: 2%; transform: scale(0.7); }
            .floating-decoration { font-size: 1.8rem; }
        }

        @media (max-width: 480px) {
            .collage-container { grid-template-columns: repeat(2, 1fr); }
            .photo-placeholder { height: 120px; }
            .flower-container { transform: scale(0.5); }
        }

        /* Efectos de entrada mejorados */
        .fade-in-up {
            opacity: 0;
            transform: translateY(50px);
            animation: fadeInUp 1s ease-out forwards;
        }

        @keyframes fadeInUp { to { opacity: 1; transform: translateY(0); } }
    </style>
</head>
<body>
<!-- Partículas de fondo -->
<div class="particles">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
</div>

<!-- Decoraciones flotantes -->
<div class="floating-decoration">👔</div>
<div class="floating-decoration">🏆</div>
<div class="floating-decoration">⭐</div>
<div class="floating-decoration">🎖️</div>

<!-- Flor azul animada -->
<div class="flower-container">
    <div class="flower">
        <div class="petal"></div>
        <div class="petal"></div>
        <div class="petal"></div>
        <div class="petal"></div>
        <div class="petal"></div>
        <div class="petal"></div>
        <div class="petal"></div>
        <div class="petal"></div>
        <div class="flower-center"></div>
    </div>
</div>

<!-- Sección principal -->
<section class="hero-section">
    <h1 class="main-title">FELIZ DÍA DEL PADRE</h1>
    <div class="subtitle typewriter">El héroe de mi vida ❤️</div>

    <!-- Collage de fotos -->
    <div class="photo-collage">
        <div class="collage-container">
            <div class="photo-frame">
                <div class="photo-placeholder" style="background-image: url('images/1000018204.jpg');">
                    <span>Arrastra tu foto aquí<br>📸</span>
                </div>
                <div class="photo-caption">Nuestros momentos especiales</div>
            </div>

            <div class="photo-frame">
                <div class="photo-placeholder" style="background-image: url('images/1000018220.jpg');">
                    <span>Memoria favorita<br>💝</span>
                </div>
                <div class="photo-caption">Recuerdos inolvidables</div>
            </div>

            <div class="photo-frame">
                <div class="photo-placeholder" style="background-image: url('images/1000018221.jpg');">
                    <span>Aventuras juntos<br>🎉</span>
                </div>
                <div class="photo-caption">Aventuras padre e hijo</div>
            </div>

            <div class="photo-frame">
                <div class="photo-placeholder" style="background-image: url('images/1000019289.jpg');">
                    <span>Tradiciones<br>🎂</span>
                </div>
                <div class="photo-caption">Tradiciones familiares</div>
            </div>

            <div class="photo-frame">
                <div class="photo-placeholder" style="background-image: url('images/1000070624.jpg');">
                    <span>Momentos divertidos<br>😄</span>
                </div>
                <div class="photo-caption">Risas y diversión</div>
            </div>

            <div class="photo-frame">
                <div class="photo-placeholder" style="background-image: url('images/1000071475.jpg');">
                    <span>Mi héroe<br>🦸‍♂️</span>
                </div>
                <div class="photo-caption">Mi superhéroe personal</div>
            </div>
        </div>
    </div>

    <!-- Mensaje especial -->
    <div class="special-message">
        <p class="message-text">
            Gracias por ser mi guía, mi ejemplo a seguir y mi mayor inspiración.
            Por todas las noches que te desvelaste cuidándome y todos los días que trabajaste
            incansablemente para darnos lo mejor.
        </p>
        <p class="message-text">
            Por enseñarme el valor del esfuerzo, la importancia de la honestidad
            y el poder del amor incondicional.
        </p>
        <p class="message-text">
            ¡ERES EL MEJOR PADRE DEL MUNDO! 👑
        </p>
    </div>

    <button class="action-button" onclick="celebrateFathersDay()" aria-label="Celebrar el Día del Padre">
        🎊 ¡FELIZ DÍA PAPÁ! 🎊
    </button>
</section>

<script>
    // Función para celebrar el día del padre
    function celebrateFathersDay() {
        const emojis = ['❤️', '💖', '🎉', '🎊', '👔', '🏆', '⭐', '💝', '🎂', '🦸‍♂️'];
        for (let i = 0; i < 30; i++) {
            const emoji = document.createElement('div');
            emoji.textContent = emojis[Math.floor(Math.random() * emojis.length)];
            emoji.style.position = 'fixed';
            emoji.style.left = '50%';
            emoji.style.top = '50%';
            emoji.style.fontSize = Math.random() * 30 + 20 + 'px';
            emoji.style.pointerEvents = 'none';
            emoji.style.zIndex = '1000';
            emoji.style.userSelect = 'none';

            const angle = (i / 30) * 360;
            const distance = Math.random() * 300 + 100;
            const duration = Math.random() * 2 + 2;

            emoji.style.animation = `emojiExplosion ${duration}s ease-out forwards`;
            emoji.style.setProperty('--angle', angle + 'deg');
            emoji.style.setProperty('--distance', distance + 'px');
            emoji.style.animationDelay = Math.random() * 0.5 + 's';

            document.body.appendChild(emoji);
            setTimeout(() => emoji.remove(), duration * 1000);
        }

        setTimeout(() => {
            const messages = [
                '¡Que tengas un día maravilloso, papá! 🎉',
                '¡Eres increíble! Gracias por todo lo que haces. ❤️',
                '¡Te amo mucho, papá! Eres mi héroe. 🦸‍♂️',
                '¡Feliz Día del Padre al mejor papá del mundo! 👑'
            ];
            const randomMessage = messages[Math.floor(Math.random() * messages.length)];
            alert(randomMessage);
        }, 1000);
    }

    // Animación para explosión de emojis
    const style = document.createElement('style');
    style.textContent = `
            @keyframes emojiExplosion {
                0% { transform: translate(-50%, -50%) rotate(0deg) scale(0); opacity: 1; }
                70% { opacity: 1; transform: translate(-50%, -50%) rotate(var(--angle)) translateY(calc(-1 * var(--distance))) scale(1); }
                100% { opacity: 0; transform: translate(-50%, -50%) rotate(var(--angle)) translateY(calc(-1.5 * var(--distance))) scale(0.5); }
            }
        `;
    document.head.appendChild(style);

    // Funcionalidad de drag and drop para fotos
    document.querySelectorAll('.photo-placeholder').forEach(placeholder => {
        // Permitir soltar elementos
        placeholder.addEventListener('dragover', (e) => {
            e.preventDefault();
            placeholder.style.background = 'linear-gradient(135deg, #4ecdc4, #44a08d)';
            placeholder.style.transform = 'scale(1.05)';
        });

        // Restaurar estilo al salir del área de arrastre
        placeholder.addEventListener('dragleave', () => {
            placeholder.style.backgroundImage = getComputedStyle(placeholder).backgroundImage || 'linear-gradient(135deg, #667eea, #764ba2)';
            placeholder.style.transform = 'scale(1)';
        });

        // Manejar el evento de soltar la imagen
        placeholder.addEventListener('drop', (e) => {
            e.preventDefault();
            placeholder.style.background = 'linear-gradient(135deg, #667eea, #764ba2)';
            placeholder.style.transform = 'scale(1)';

            const files = e.dataTransfer.files;
            if (files.length > 0) {
                const file = files[0];
                if (file.type.startsWith('image/')) {
                    const reader = new FileReader();
                    reader.onload = (event) => {
                        placeholder.style.backgroundImage = `url(${event.target.result})`;
                        placeholder.querySelector('span').style.display = 'none';
                        placeholder.style.cursor = 'default';
                    };
                    reader.readAsDataURL(file);
                } else {
                    alert('Por favor, arrastra una imagen válida.');
                }
            }
        });
    });
</script>
</body>
</html>
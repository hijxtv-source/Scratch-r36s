# Scratch Everywhere! en R36S

Port basado en la plataforma "pc" (SDL2) de Scratch Everywhere! 1.3 para Linux aarch64.

## Compilar
- GitHub Actions: subir el repo y correr el workflow "R36S Nightly Build" (runner arm64), o
- Local: `docker buildx build --platform linux/arm64 -f docker/Dockerfile.r36s --target exporter -o type=local,dest=. .`

## Instalar
1. Copiar `ScratchEverywhere.sh` y la carpeta `ScratchEverywhere/` a la carpeta `ports` de la SD.
2. Poner tus `.sb3` en `ScratchEverywhere/scratch-everywhere/`.
3. Reiniciar EmulationStation y abrir Ports > ScratchEverywhere.

## Controles
Gamepad como en el resto del runtime; modo mouse: mantener L, D-pad mueve, R hace clic.
Si falla, revisar `ScratchEverywhere/log.txt`.

## Controles en R36S (v2)
- **Salir:** mantener START + SELECT medio segundo.
- **Mouse:** stick derecho mueve el cursor (cuadro azul).
- **R2:** clic izquierdo. **R3** (presionar stick derecho): clic derecho.

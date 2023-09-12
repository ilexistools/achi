/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Step Event
if (alpha < 1) {
    alpha += fade_speed; // Increase alpha by fadeSpeed per step
}

// Make sure alpha doesn't exceed 1
if (alpha > 1) {
    alpha = 1;
}


function graphikInit(r=1, resultBean){
    const canvas = document.getElementById('canvas1');
    const ctx = canvas.getContext('2d');
    canvas.width = 400;
    canvas.height = 400;
    drawRect(canvas, ctx);
    drawTriangle(canvas, ctx);
    drawCircle(canvas, ctx);
    drawGrid(canvas, ctx, r);

}

function drawRect(canvas, ctx){
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    ctx.fillStyle = "Violet";
    ctx.beginPath();
    ctx.moveTo(centerX, centerY);
    ctx.lineTo(20, centerY);
    ctx.lineTo(20, 20);
    ctx.lineTo(centerX, 20);
    ctx.closePath();
    ctx.fill();
}
function drawTriangle(canvas, ctx){
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    const radius = (canvas.width / 2) - 20; // Радиус (R), расстояние от центра до края

    ctx.fillStyle = "Violet";
    const stepX = radius / 2;
    const stepY = radius / 2;
    ctx.beginPath();
    ctx.moveTo(centerX, centerY);
    ctx.lineTo(centerX - stepX, centerY);
    ctx.lineTo(centerX, centerY + stepY);
    ctx.closePath();
    ctx.fill();
}

function drawCircle(canvas, ctx){
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    const radius = (canvas.width / 2) - 20;

    ctx.fillStyle = "Violet";
    ctx.beginPath();
    ctx.moveTo(centerX, centerY);
    ctx.arc(centerX, centerY, radius, -Math.PI/2, 0, false);
    ctx.closePath()
    ctx.fill();
}

function drawGrid(canvas, ctx, r) {
    const centerX = canvas.width / 2;
    const centerY = canvas.height / 2;
    const width = canvas.width;
    const height = canvas.height;
    const radius = (canvas.width / 2) - 20;

    ctx.font = '12px Arial';
    ctx.fillStyle = 'black';
    ctx.beginPath();

    // Рисование осей
    ctx.strokeStyle = 'black';
    ctx.lineWidth = 2;
    ctx.moveTo(0, centerY); // Ось X
    ctx.lineTo(width, centerY);
    ctx.moveTo(centerX, 0); // Ось Y
    ctx.lineTo(centerX, height);

    // Метки на оси X
    const stepX = radius / 2; // Шаг между метками по X
    ctx.moveTo(centerX + stepX, centerY - 5); // R/2
    ctx.lineTo(centerX + stepX, centerY + 5);
    ctx.fillText((r/2).toFixed(2), centerX + stepX, centerY - 10);

    ctx.moveTo(centerX - stepX, centerY - 5); // -R/2
    ctx.lineTo(centerX - stepX, centerY + 5);
    ctx.fillText((-r/2).toFixed(2), centerX - stepX, centerY - 10);

    ctx.moveTo(centerX + radius, centerY - 5); // R
    ctx.lineTo(centerX + radius, centerY + 5);
    ctx.fillText(r, centerX + radius, centerY - 10);

    ctx.moveTo(centerX - radius, centerY - 5); // -R
    ctx.lineTo(centerX - radius, centerY + 5);
    ctx.fillText((-r).toFixed(2), centerX - radius, centerY - 10);

    // Метки на оси Y
    const stepY = radius / 2; // Шаг между метками по Y
    ctx.moveTo(centerX - 5, centerY - stepY); // R/2
    ctx.lineTo(centerX + 5, centerY - stepY);
    ctx.fillText((r/2).toFixed(2), centerX + 10, centerY - stepY + 5);

    ctx.moveTo(centerX - 5, centerY + stepY); // -R/2
    ctx.lineTo(centerX + 5, centerY + stepY);
    ctx.fillText((-r/2).toFixed(2), centerX + 10, centerY + stepY + 5);

    ctx.moveTo(centerX - 5, centerY - radius); // R
    ctx.lineTo(centerX + 5, centerY - radius);
    ctx.fillText(r, centerX + 10, centerY - radius + 5);

    ctx.moveTo(centerX - 5, centerY + radius); // -R
    ctx.lineTo(centerX + 5, centerY + radius);
    ctx.fillText((-r).toFixed(2), centerX + 10, centerY + radius + 5);

    ctx.stroke();
}
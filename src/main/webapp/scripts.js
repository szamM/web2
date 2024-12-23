const url = "controller"


// вспомогательные к html
function toggleActive(element, cls) {
    const elements = document.querySelectorAll(cls);
    elements.forEach(el => el.classList.remove('active'));

    element.classList.add('active');
}
function redrawPoints(pointsL, R) {
    pointsL.forEach(point => {
        const [x, y, r, status] = point; // Деструктуризация массива
        drawDot(x, y, R, status);       // Отрисовка точки
    });
}
function checkOnly(checkbox, cls) {
    const checkboxes = document.querySelectorAll(cls);

    checkboxes.forEach((chk) => {
        if (chk !== checkbox) {
            chk.checked = false;
        }
    });
}

function createError(message) {
    console.log(message);
    const error = document.getElementById("text-error");
    error.textContent = message;
}


const validateX = (value) => {
    return new Promise((resolve, reject) => {
        if (isNaN(value) || (-5) > value || value > 3) {
            console.info(value);
            reject("значение x некорректно");
        } else {
            resolve();
        }
    });
}

const validateY = (value) => {
    return new Promise((resolve, reject) => {
        if (isNaN(value) || (-5) > value || value > 3) {
            reject("значение y некорректно");
        } else {
            resolve();
        }
    });
}

const validateR = (value) => {
    return new Promise((resolve, reject) => {
        if (isNaN(value) || (1) > value || value > 5) {
            reject("значение r некорректно");
        } else {
            resolve();
        }
    });
}


function validate(x, y, r) {
    return Promise.all([
        validateX(x),
        validateY(y),
        validateR(r)
    ]);
}

function submitForm(x, y, r) {
    console.info(x.value, y.value, r.value)
    if (!x) {
        const errorX = document.getElementById("error-message-x");
        errorX.innerHTML = "Выберите значение X";

    }
    else if (!r) {
        const errorR = document.getElementById("error-message-r");
        errorR.innerHTML = "Выберите значение R";
    }
    else if (isNaN(y.value) || (-5) > y.value || y.value > 3){
        const errorY = document.getElementById("error-message-y");
        errorY.innerHTML = "Выберите корректное значение Y";
    }
    else {
        validateAndSend(x.value, y.value, r.value);
    }
}

function createError(msg) {
    alert(msg)
}

function validateAndSend(x, y, r) {
    console.info(x, y, r);
    validate(x, y, r)
        .then(() => {
            sendData(x, y, r);
        }).catch((error) => {
        createError(error);
    });
}

function sendData(x, y, r) {
    fetch(url + `?x=${x}&y=${y}&r=${r}`, { method: "GET" })
        .then(response => {
            if (!response.ok) {
                throw new Error(response.statusText)
            }
            return response.text();
        })
        .then(html => {
            console.info(html);
            document.open();
            document.write(html);
            document.close();
        })
        .catch((err) => {
            createError(err)
        });
}

function drawDot(x, y, r, status) {
    const canvas = document.getElementById('canvas1');
    const ctx = canvas.getContext('2d');
    const formula = (coord, radius) => (200 + (4 * coord * 40) / radius);
    ctx.beginPath();
    ctx.fillStyle = status ? '#52cf41' : '#EE204D';
    ctx.moveTo(200, 200);
    ctx.arc(formula(x, r), formula(-y, r), 5, 0, 2 * Math.PI);
    ctx.fill();
    ctx.closePath();
    console.log("dot has been drawn");
}

// отправка по нажатию
function byClick(event, canvas, R) {
    const r = document.querySelector('.r-checkbox:checked');

    const rect = canvas.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;

    const canvasX = x - canvas.width / 2;
    const canvasY = canvas.height / 2 - y;

    const xValue = (canvasX / R * r.value).toFixed(4);
    const yValue = (canvasY / R * r.value).toFixed(4);
    console.log(`Данные нажатия: (${xValue}, ${yValue}, ${r.value})`);
    validateAndSend(xValue, yValue, r.value);
}
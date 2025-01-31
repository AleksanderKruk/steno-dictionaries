function createButton(buttonCharacter, isClicked) {
    var button = document.createElement("div")
    button.className = isClicked? "button clicked" : "button"
    button.innerText = buttonCharacter
    return button
}

function createNumericButton(buttonCharacter, digit, isCharacter, isDigit) {
    if (isDigit) {
        return createButton(digit, true)
    }
    return createButton(buttonCharacter, isCharacter)
}

function createPlaceholder() {
    var ph = document.createElement("div")
    ph.className = "placeholder"
		ph.innerText = ""
    return ph
}

function createKeyboard(chord) {
    var chordsyntax = /(S)?(1)?(T)?(2)?(P)?(3)?(H)?(4)?(K)?(W)?(R)?(A)?(0)?(O)?(5)?-?(\*)?(E)?(U)?(F)?(6)?(P)?(7)?(L)?(8)?(T)?(9)?(D)?(R)?(B)?(G)?(S)?(Z)?/
    var result = chord.match(chordsyntax)
    var has_S_L = result[1] !== undefined
    var has_1 = result[2] !== undefined
    var has_T_L = result[3] !== undefined
    var has_2 = result[4] !== undefined
    var has_P_L = result[5] !== undefined
    var has_3 = result[6] !== undefined
    var has_H_L = result[7] !== undefined
    var has_4 = result[8] !== undefined
    var has_K_L = result[9] !== undefined
    var has_W_L = result[10] !== undefined
    var has_R_L = result[11] !== undefined
    var has_A = result[12] !== undefined
    var has_0 = result[13] !== undefined
    var has_O = result[14] !== undefined
    var has_5 = result[15] !== undefined
    var has_STAR = result[16] !== undefined
    var has_E = result[17] !== undefined
    var has_U = result[18] !== undefined
    var has_F_R = result[19] !== undefined
    var has_6 = result[20] !== undefined
    var has_P_R = result[21] !== undefined
    var has_7 = result[22] !== undefined
    var has_L_R = result[23] !== undefined
    var has_8 = result[24] !== undefined
    var has_T_R = result[25] !== undefined
    var has_9 = result[26] !== undefined
    var has_D_R = result[27] !== undefined
    var has_R_R = result[28] !== undefined
    var has_B_R = result[29] !== undefined
    var has_G_R = result[30] !== undefined
    var has_S_R = result[31] !== undefined
    var has_Z_R = result[32] !== undefined
    var keyboard = document.createElement("div")
    keyboard.className = "keyboard"

    var upper_row = document.createElement("div")
    upper_row.className = "row"
    upper_row.appendChild(createNumericButton("S", "1", has_S_L, has_1))
    upper_row.appendChild(createNumericButton("T", "2", has_T_L, has_2))
    upper_row.appendChild(createNumericButton("P", "3", has_P_L, has_3))
    upper_row.appendChild(createNumericButton("H", "4", has_H_L, has_4))
    upper_row.appendChild(createButton("*", has_STAR))
    upper_row.appendChild(createButton("*", has_STAR))
    upper_row.appendChild(createNumericButton("F", "6", has_F_R, has_6))
    upper_row.appendChild(createNumericButton("P", "7", has_P_R, has_7))
    upper_row.appendChild(createNumericButton("L", "8", has_L_R, has_8))
    upper_row.appendChild(createNumericButton("T", "9", has_T_R, has_9))
    upper_row.appendChild(createButton("D", has_D_R))

    var lower_row = document.createElement("div")
    lower_row.className = "row"

    lower_row.appendChild(createButton("S", has_S_L))
    lower_row.appendChild(createButton("K", has_K_L))
    lower_row.appendChild(createButton("W", has_W_L))
    lower_row.appendChild(createButton("R", has_R_L))
    lower_row.appendChild(createButton("*", has_STAR))
    lower_row.appendChild(createButton("*", has_STAR))
    lower_row.appendChild(createButton("R", has_R_R))
    lower_row.appendChild(createButton("B", has_B_R))
    lower_row.appendChild(createButton("G", has_G_R))
    lower_row.appendChild(createButton("S", has_S_R))
    lower_row.appendChild(createButton("Z", has_Z_R))

    var vowel_row = document.createElement("div")
    vowel_row.className = "row"

		vowel_row.appendChild(createPlaceholder())
		vowel_row.appendChild(createPlaceholder())
    vowel_row.appendChild(createNumericButton("A", "0", has_A, has_0))
    vowel_row.appendChild(createNumericButton("O", "5", has_O, has_5))
    vowel_row.appendChild(createButton("", false))
    vowel_row.appendChild(createButton("", false))

		vowel_row.appendChild(createButton("E", has_E))
    vowel_row.appendChild(createButton("U", has_U))

		keyboard.appendChild(upper_row)
		keyboard.appendChild(lower_row)
		keyboard.appendChild(vowel_row)
    return keyboard
}


function createKeyboards(chords) {
    var keyboards = document.createElement("div")
    keyboards.className = "keyboards"
    for (var chord of chords.split("/")) {
        keyboards.appendChild(createKeyboard(chord))
    }
    return keyboards
}
var x = document.getElementById("contents")
var lines = x.innerHTML.split(/<br>/)
x.innerHTML = ""
for (var chords of lines) {
  x.appendChild(createKeyboards(chords))
}
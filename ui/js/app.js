// Navigation function
function showSection(sectionId) {
    // Hide all sections
    const sections = document.querySelectorAll('.ui-section');
    sections.forEach(section => section.classList.remove('active'));
    
    // Remove active class from all nav pills
    const pills = document.querySelectorAll('.nav-pill');
    pills.forEach(pill => pill.classList.remove('active'));
    
    // Show selected section
    document.getElementById(sectionId).classList.add('active');
    
    // Add active class to clicked nav pill
    const clickedPill = Array.from(pills).find(pill => 
        pill.textContent.includes(getJapaneseLabel(sectionId))
    );
    if (clickedPill) {
        clickedPill.classList.add('active');
    }
}

function getJapaneseLabel(sectionId) {
    const labels = {
        'character': 'キャラクター選択',
        'inventory': 'インベントリ',
        'phone': '電話アプリ',
        'hud': 'HUD・ステータス'
    };
    return labels[sectionId] || sectionId;
}

// Initialize all interactive elements
document.addEventListener('DOMContentLoaded', function() {
    // Add hover effects for inventory slots
    const inventorySlots = document.querySelectorAll('.inventory-slot');
    
    inventorySlots.forEach(slot => {
        slot.addEventListener('dragover', function(e) {
            e.preventDefault();
            this.style.background = 'rgba(0, 255, 204, 0.2)';
        });
        
        slot.addEventListener('dragleave', function() {
            this.style.background = '';
        });
        
        slot.addEventListener('drop', function(e) {
            e.preventDefault();
            this.style.background = '';
            // ドロップ処理をここに実装
        });
    });

    // Phone app interactions
    const phoneApps = document.querySelectorAll('.phone-app');
    phoneApps.forEach(app => {
        app.addEventListener('click', function() {
            const appName = this.querySelector('.app-name').textContent;
            console.log(`${appName} アプリを開きました`);
            // アプリ開く処理をここに実装
        });
    });

    // Character card selection
    const characterCards = document.querySelectorAll('.character-card:not(.create-character)');
    characterCards.forEach(card => {
        card.addEventListener('click', function() {
            // Remove previous selection
            characterCards.forEach(c => {
                c.style.border = '';
                c.style.boxShadow = '';
            });
            // Add selection border
            this.style.border = '2px solid #00ffcc';
            this.style.boxShadow = '0 12px 40px rgba(0, 255, 204, 0.4)';
        });
    });
    
    const createBackBtn = document.querySelector('.character-back-button');
    if (createBackBtn) {
        createBackBtn.addEventListener('click', function() {
            showSection("character");
        });
    }

    const characterDelBtn = document.querySelectorAll(".delete-character-btn");
    if (characterDelBtn) {
        characterDelBtn.forEach((btn) => {
            btn.addEventListener('click', function() {
                const userId = this.value;

                fetch('https://dg-core/deleteCharacter', {
                    body: JSON.stringify({user_id: userId}),
                    headers: {
                        "Content-Type": "application/json; charset=UTF-8",
                    },
                    method: "POST"
                });
            });
        })
    }

    // Create character button
    const createBtn = document.querySelector('.create-character');
    if (createBtn) {
        createBtn.addEventListener('click', function() {
            // キャラクター作成画面への遷移処理
            showSection("character-creation");
        });
    }

    // Status circle animations
    const statusCircles = document.querySelectorAll('.status-circle');
    statusCircles.forEach(circle => {
        circle.addEventListener('mouseenter', function() {
            this.style.transform = 'scale(1.1)';
            this.style.transition = 'transform 0.3s ease';
        });
        
        circle.addEventListener('mouseleave', function() {
            this.style.transform = 'scale(1)';
        });
    });

    // Navigation pills click handler
    const navPills = document.querySelectorAll('.nav-pill');
    navPills.forEach(pill => {
        pill.addEventListener('click', function() {
            const text = this.textContent;
            let sectionId = '';
            
            if (text.includes('キャラクター選択')) sectionId = 'character';
            else if (text.includes('インベントリ')) sectionId = 'inventory';
            else if (text.includes('電話アプリ')) sectionId = 'phone';
            else if (text.includes('HUD・ステータス')) sectionId = 'hud';
            
            if (sectionId) {
                showSection(sectionId);
            }
        });
    });
});

// Character Creation Functions
function initializeCharacterCreation() {
    // Initialize birth year options
    const currentYear = new Date().getFullYear();
    const birthYearSelect = document.getElementById('birthYear');
    const birthDaySelect = document.getElementById('birthDay');
    
    if (birthYearSelect) {
        for (let year = currentYear - 80; year <= currentYear - 18; year++) {
            const option = document.createElement('option');
            option.value = year;
            option.textContent = year + '年';
            birthYearSelect.appendChild(option);
        }
    }

    // Initialize birth day options
    updateBirthDays();

    // Add event listeners for form inputs
    const formInputs = document.querySelectorAll('#character-creation input, #character-creation select');
    formInputs.forEach(input => {
        input.addEventListener('change', updatePreview);
        input.addEventListener('input', updatePreview);
    });

    // Add event listener for birth month change
    const birthMonthSelect = document.getElementById('birthMonth');
    if (birthMonthSelect) {
        birthMonthSelect.addEventListener('change', updateBirthDays);
    }

    // Add form submission handler
    const characterForm = document.querySelector('.character-form');
    if (characterForm) {
        characterForm.addEventListener('submit', handleCharacterCreation);
    }
}

function updateBirthDays() {
    const monthSelect = document.getElementById('birthMonth');
    const daySelect = document.getElementById('birthDay');
    const yearSelect = document.getElementById('birthYear');
    
    if (!monthSelect || !daySelect || !yearSelect) return;

    const month = parseInt(monthSelect.value);
    const year = parseInt(yearSelect.value) || 2000;
    
    // Clear existing options
    daySelect.innerHTML = '<option value="">日</option>';
    
    if (month) {
        const daysInMonth = new Date(year, month, 0).getDate();
        
        for (let day = 1; day <= daysInMonth; day++) {
            const option = document.createElement('option');
            option.value = day;
            option.textContent = day + '日';
            daySelect.appendChild(option);
        }
    }
}

function updatePreview() {
    const lastname = document.getElementById('lastname')?.value || '';
    const firstname = document.getElementById('firstname')?.value || '';
    const birthYear = document.getElementById('birthYear')?.value || '';
    const birthMonth = document.getElementById('birthMonth')?.value || '';
    const birthDay = document.getElementById('birthDay')?.value || '';
    const gender = document.querySelector('input[name="gender"]:checked')?.value || '';
    const nationality = document.getElementById('nationality')?.value || '';

    // Update preview name
    const previewName = document.getElementById('previewName');
    if (previewName) {
        const fullName = (firstname + ' ' + lastname).trim();
        previewName.textContent = fullName || '未入力';
    }

    // Update preview age
    const previewAge = document.getElementById('previewAge');
    if (previewAge && birthYear && birthMonth && birthDay) {
        const birthDate = new Date(birthYear, birthMonth - 1, birthDay);
        const today = new Date();
        let age = today.getFullYear() - birthDate.getFullYear();
        const monthDiff = today.getMonth() - birthDate.getMonth();
        
        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        
        previewAge.textContent = age;
    } else if (previewAge) {
        previewAge.textContent = '-';
    }

    // Update preview gender
    const previewGender = document.getElementById('previewGender');
    if (previewGender) {
        previewGender.textContent = gender || '未選択';
    }

    // Update preview nationality
    const previewNationality = document.getElementById('previewNationality');
    if (previewNationality) {
        const nationalitySelect = document.getElementById('nationality');
        const selectedOption = nationalitySelect?.querySelector(`option[value="${nationality}"]`);
        previewNationality.textContent = selectedOption?.textContent || '未選択';
    }

    // Update preview avatar
    const previewAvatar = document.querySelector('.preview-avatar');
    if (previewAvatar) {
        if (lastname) {
            previewAvatar.textContent = lastname.charAt(0);
        } else {
            previewAvatar.textContent = '?';
        }
    }
}

function handleCharacterCreation(event) {
    event.preventDefault();
    
    let formData = {
        lastname: document.getElementById('lastname').value,
        firstname: document.getElementById('firstname').value,
        birthYear: document.getElementById('birthYear').value,
        birthMonth: document.getElementById('birthMonth').value,
        birthDay: document.getElementById('birthDay').value,
        gender: document.querySelector('input[name="gender"]:checked').value,
        nationality: document.getElementById('nationality').value
    };

    // Validation
    if (!formData.lastname || !formData.firstname || !formData.birthYear || 
        !formData.birthMonth || !formData.birthDay || !formData.gender || !formData.nationality) {
        alert('すべての必須項目を入力してください。');
        return;
    }

    // Calculate age
    const birthDate = new Date(formData.birthYear, formData.birthMonth - 1, formData.birthDay);
    const today = new Date();
    let age = today.getFullYear() - birthDate.getFullYear();
    const monthDiff = today.getMonth() - birthDate.getMonth();
    
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }

    if (age < 18) {
        alert('キャラクターの年齢は18歳以上である必要があります。');
        return;
    }

    // Success message and return to character selection
    // alert(`キャラクター「${formData.lastname} ${formData.firstname}」が作成されました！`);
    
    // Reset form
    document.querySelector('.character-form').reset();
    updatePreview();
    
    // Return to character selection
    showSection('character');
    
    // Here you would normally send the data to your FiveM server
    formData["birthday"] = `${formData.birthYear}-${formData.birthMonth}-${formData.birthDay}`
    console.log('Character Creation Data:', formData);

    fetch('https://dg-core/createCharacter', {
        body: JSON.stringify(formData),
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        method: "POST"
    });
}

// キャラクターを並べる
function renderCharacterList(characters) {
    const grid = document.querySelector(".character-grid");
    grid.innerHTML = "";

    // 作成済みのキャラクターカード
    characters.forEach(character => {
        const card = document.createElement("div");
        card.className = "character-card glass-panel";
        card.innerHTML = `
            <div class="character-avatar">${character.firstname[0]}</div>
            <div class="character-info">
                <h3 class="text-shadow">${character.firstname} ${character.lastname}</h3>
                <div class="character-details">
                    <span>性別: ${character.gender}</span>
                    <span>国籍：${character.nationality}</span>
                </div>
                <div class="character-details">
                    <span>スロット：${character.slot}</span>
                    <span>所持金：¥${character.cash}</span>
                </div>
            </div>
            <button class="delete-character-btn" value=${character.id} title="キャラクターを削除">
                <span>×</span>
            </button>
        `;
        grid.appendChild(card);
    });

    if (characters.length < 3) {
        const createCard = document.createElement("div");
        createCard.className = "character-card glass-panel create-character";
        createCard.onclick = function() {
            showSection("character-creation");
            initializeCharacterCreation();
        }
        createCard.innerHTML = `
            <div>
                <div style="font-size: 48px; margin-bottom: 16px;">+</div>
                <div class="text-shadow" style="font-size: 18px; font-weight: 500;">新規キャラクター作成</div>
            </div>
        `;
        grid.appendChild(createCard);
    }
}

window.addEventListener("message", (event) => {
    const data = event.data;

    // 
    if (data.action === "showCharacter") {
        console.log("showCharacterが呼び出されました");

        renderCharacterList(data.characters);
        showSection('character');
    }
})

// renderCharacterList([{
//     'id': '1234',
//     'firstname': '田中',
//     'lastname': '太郎',
//     'gender': '男性',
//     'nationality': '日本',
//     'slot': 1,
//     'cash': 500,
// }])
// showSection('character')
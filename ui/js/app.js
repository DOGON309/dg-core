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

    // Create character button
    const createBtn = document.querySelector('.create-character');
    if (createBtn) {
        createBtn.addEventListener('click', function() {
            alert('キャラクター作成画面を開きます');
            // キャラクター作成画面への遷移処理
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

window.addEventListener("message", (event) => {
    const data = event.data;

    // 
    if (data.action === "showCharacterMenu") {
        document.querySelector('.nav-container').style.display = "none";
        document.querySelector('.ui-section').forEach(s => s.classList.remove('active'));
        document.getElementById('character').classList.add("active")

        renderCharacterCards(data.characters);
    }
})

function selectCharacter(id) {
    fetch(`https://dg-core/selectCharacter`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id })
    });
}

function createCharacterDialog() {
    const firstname = prompt("名前（名）:");
    const lastname = prompt("名前（姓）:");
    const birthday = prompt("誕生日 (YYYY-MM-DD):");
    const gender = prompt("性別:");
    const nationality = prompt("国籍:");

    if (firstname && lastname && birthday && gender && nationality) {
        fetch(`https://dg-core/createCharacter`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ firstname, lastname, birthday, gender, nationality })
        });
    }
}
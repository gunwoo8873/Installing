import { Fornt } from `../Fornt`

// Data Timer
const timer = {
    
    head_today: function(){
        const head_today = document.getElementById(`today`)
        return head_today.innerHTML = new Date().toLocaleString()
    },

    project_day: function(){
        const day_count = document.getElementById(`project__daycount`)
    }
}

setInterval(timerData.head_today, 1000)
// Data Timer
import { Fornt } from `../Fornt`

const timerData = {
    head_today: function(){
        const head_today = document.getElementById(`today`)
        return head_today.innerHTML = new Date().toLocaleString()
    },
    nav_project_day: function(Data){
        const day = document.getElementById(`project_day`)
        return day.innerHTML = {
            today: new Date().getDay() + 1,
        }
    }
}

setInterval(timerData.head_today, 1000)
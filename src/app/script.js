// Data Timer
const timerData = {
    head_timer: function(){
        const head_today = document.getElementById(`today__timer`)
        return head_today.innerHTML = new Date().toLocaleTimeString()
    }
}
setInterval(timerData.head_timer, 1000)
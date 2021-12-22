function handleWeekends(id,meal_date) {
    var day = new Date(meal_date).getUTCDay();
    if([6,0].includes(day)){
        document.getElementById(id).value = '';
        alert('Office will be closed in this date : '+ meal_date);
    }
}

function handleMealDateChange(id) {
    var id = id;
    var meal_date=document.getElementById(id).value;  
    handleWeekends(id , meal_date);
    window.location.href = "/menu/date/"+meal_date+"/interval/BREAKFAST";
}

function handleVisitDateChange(id) {
    var id = id;
    var meal_date = document.getElementById(id).value; 
    handleWeekends(id , meal_date);
}

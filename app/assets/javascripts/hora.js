function timer()
{
        var d = new Date();
        document.getElementById('date').innerHTML = d.toLocaleTimeString();
       
}


function tempo()
{
        setTimeout('timer()', 1000);
}
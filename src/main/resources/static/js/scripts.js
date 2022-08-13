/*$("#captchaForm").submit(function(e) {
    e.preventDefault();

    var form = $(this);
    var actionUrl = form.attr('action');
    const data = new FormData(e.target);
    console.log(actionUrl);
    const username = data.get('username');
    const password = data.get('password');
    const encodedBase64Token = Buffer.from(`${username}:${password}`).toString('base64'); 
    const authorization = `Basic ${encodedBase64Token}`;

    $.ajax({
        type: "POST",
        url: '/captchaLogin',
        dataType: 'json',
        data: value,
        contentType: 'application/json;charset=UTF-8',
        beforeSend: function(request) {
            request.setRequestHeader("Authorization", authorization);
          },
    });
    
});*/

function mySubmitFunction(e) {
    e.preventDefault();
    var form = document.getElementById("captchaForm");
    var actionUrl = form.attr('action');
    const data = new FormData(e.target);
    console.log(actionUrl);
    const username = data.get('username');
    const password = data.get('password');
    const encodedBase64Token = Buffer.from(`${username}:${password}`).toString('base64');
    console.log(encodedBase64Token);
    return false;
}

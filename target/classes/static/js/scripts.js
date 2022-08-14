async function mySubmitFunction(e) {
    e.preventDefault();

    if(grecaptcha.getResponse().length == 0){
        alert("Teljesítst a captcha verifikációt!")
    }else {

        var formEl = document.forms.captchaForm;
        var formData = new FormData(formEl);
        var username = formData.get('username');
        var password = formData.get("password");
        var hash = btoa(username + ":" + password);
        var token = "Basic "+hash ;

        const request = new Request("http://localhost:8080/captchaLogin", {
                headers: new Headers({
                    "Authorization": token,
                }),
                body:grecaptcha.getResponse(),
                method: 'POST'
            }
        );

        var response = await fetch(request);
        var statusCode =response.status
        if(statusCode == 200){
            window.location.replace("http://localhost:8080/home");
        }else{
            window.location.reload();
        }
    }
}

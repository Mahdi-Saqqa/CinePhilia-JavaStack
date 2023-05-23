<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap Site</title>
        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
            integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I"
            crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
            integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
            crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Hello-Bootstrap</h1>

        <input type="text" id="search">
        <div id="result">

        </div>

        <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                    $("#search").on("input",function(){
                    let query =  $("#search").val();
                        $.ajax({
                            url: "https://9099-45-117-5-148.ngrok-free.app/api/v1/movies/findByTitle/"+query,
                            type: "GET",
                            success: function (data) {
                                console.log(data);
                                let result = $("#result");
                                result.empty();
                                for(let i=0; i<data.length; i++) {
                                    let movie = data[i];
                                    let title = movie["title"];
                                    let overview = movie["overview"];
                                    let body = `<div class="card"><div class="card-header">`+title+` </div><div class="card-body">`+overview +`</div> </div>`;
                                    result.append(body);
                                }
                        },
                            error: function (){
                                console.log("error");
                            }
                    }
                        )
                    }
                    )
        </script>
    </body>
</html>
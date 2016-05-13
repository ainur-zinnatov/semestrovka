<#import "/spring.ftl" as spring />
<#assign springTags=JspTaglibs["http://www.springframework.org/tags"]>
<#assign core=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]>
<!doctype html>
<html xmlns="http://java.sun.com/jsf/html">
<head>
    <meta content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>


    <link rel="stylesheet" href="<@spring.url relativeUrl='/resources/css/reset.css"'/>"/> <!-- CSS reset -->
    <link rel="stylesheet" href="<@spring.url relativeUrl='/resources/css/style.css'/>"/> <!-- Gem style -->
    <script src="<@spring.url  relativeUrl='/resources/js/modernizr.js'/>"></script> <!-- Modernizr -->

    <title>Site</title>
</head>
<body>
<header role="banner">

    <button type="submit" class="locale" id="RUS" >RUS</button>
    <button type="submit" class="locale" id="ENG">ENG</button>
    <div id="cd-logo"><a href="#0"><img src="<@spring.url  relativeUrl='/resources/img/cd-logo.svg'/>" alt="Logo"></a></div>

    <nav class="main-nav">

        <@form.form class="cd-form"  action="logout"  method="post">

                <input class="full-width" type="submit" value="logout">

        </@form.form>

    </nav>
</header>

<div class="cd-intro">
    <h1>${message}</h1>

</div>

<div class="wordsender">
    <jsp:useBean id="page" scope="request" type="org.springframework.data.domain.Page"/>
<#list page.getContent() as pageList>

        ${pageList.word}

</#list>


    <div class="row-fluid">
        <util:pagination thispage="${page}"></util:pagination>
    </div>


</div>

<div class="footer">

    <@form.form action="game"  commandName="word" method="POST">

        <p class="wordsender">
            <@form.label path="word" cssClass="image-replace cd-email" for="signup-email">Word</@form.label>
            <@form.input path="word" cssClass="full-width has-padding has-border" id="signup-email"  placeholder="Word"/>
            <span class="cd-error-message"><@form.errors path="word" /></span>

            <input class="full-width has-padding" type="submit" value="Send">
        </p>
    </@form.form>
</div>
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script  src=https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>-->
<script type="text/javascript" src="<@spring.url  relativeUrl='/resources/js/jquery-2.2.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url  relativeUrl='/resources/js/jquery.cookie.js'/>"></script>

<script src="<@spring.url  relativeUrl='/resources/js/main.js'/>"></script> <!-- Gem jQuery -->

<script type="text/javascript">
    $(document).ready(function () {

        $('#RUS').on("click",function () {
            $.cookie('lang', 'ru', { expires: 365, path: '/' });
            window.location.reload();
        });
        $('#ENG').on("click",function () {
            $.cookie('lang', 'en', { expires: 365, path: '/' });
            window.location.reload();
        });
    })
</script>
</body>
</html>
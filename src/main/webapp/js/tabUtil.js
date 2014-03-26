var currentPage = extractUrlParam("page");

function init() {
    if (currentPage === undefined)
        currentPage = 1;
    if (currentPage <= 1) {
        $("#previous").addClass("pagination-unactive");
    }
}

function nextPage() {
    currentPage++;
    redirect();
}

function previousPage() {
    currentPage--;
    redirect();
}

function redirect() {
    window.location.replace(updateURLParameter(window.location.href, "page", currentPage));
}

function extractUrlParam(param) {
    var t = location.search.substring(1).split('&');
    var f = [];
    for (var i = 0; i < t.length; i++) {
        var x = t[ i ].split('=');
        f[x[0]] = x[1];
    }
    return f[param];
}

//http://stackoverflow.com/a/10997390
function updateURLParameter(url, param, paramVal)
{

    var TheAnchor = null;
    var newAdditionalURL = "";
    var tempArray = url.split("?");
    var baseURL = tempArray[0];
    var additionalURL = tempArray[1];
    var temp = "";

    if (additionalURL)
    {
        var tmpAnchor = additionalURL.split("#");
        var TheParams = tmpAnchor[0];
        TheAnchor = tmpAnchor[1];
        if (TheAnchor)
            additionalURL = TheParams;

        tempArray = additionalURL.split("&");

        for (i = 0; i < tempArray.length; i++)
        {
            if (tempArray[i].split('=')[0] !== param)
            {
                newAdditionalURL += temp + tempArray[i];
                temp = "&";
            }
        }
    }
    else
    {
        var tmpAnchor = baseURL.split("#");
        var TheParams = tmpAnchor[0];
        TheAnchor = tmpAnchor[1];

        if (TheParams)
            baseURL = TheParams;
    }

    if (TheAnchor)
        paramVal += "#" + TheAnchor;

    var rows_txt = temp + "" + param + "=" + paramVal;
    return baseURL + "?" + newAdditionalURL + rows_txt;
}
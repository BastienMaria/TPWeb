var currentPage = 1;
var maxPage = 10;
var nbUsersParPage = 10;
var next, previous;

function init() {
    next = $("#next");
    previous = $("#previous");
    debugger;   
    previous.attr('disabled', 'disabled');
    currentPage = 1;
}


function nextPage() {
    console.log("next page");
    currentPage++;
    updateHTML();

    // we call the servlet in ajax
    console.log("calling URL /servletUtilisateur?action=listerLesUtilisateurs&start=" + currentPage + "&max=" + nbUsersParPage);

    if (currentPage === maxPage) {
        next.disabled = true;
    }

    if (currentPage !== 1) {
        previous.disabled = false;
    }


}

function previousPage() {
    currentPage--;
    updateHTML();
    console.log("previous page");
    
    // we call the servlet in ajax
    console.log("calling URL /servletUtilisateur?action=listerLesUtilisateurs&start=" + currentPage + "&max=" + nbUsersParPage);
    
    if (currentPage === 1) {
        previous.disabled = true;
    }

    if (currentPage === 1) {
        previous.disabled = true;
    } else {
        next.disabled = false;
    }
}

function updateHTML() {
} 
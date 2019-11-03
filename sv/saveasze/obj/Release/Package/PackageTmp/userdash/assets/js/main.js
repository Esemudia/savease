{
    const toggleButton = document.querySelector('.collapseButton');
    toggleButton.addEventListener('click', () => {
        const sideNav = document.querySelector('.side-nav-collapsed');
        sideNav.classList.toggle('side-nav');
    });

    const toggleButtonSm = document.querySelector('.navButton');
    toggleButtonSm.addEventListener('click', () => {
        const sideNavSm = document.querySelector('.side-nav-collapsed');
        sideNavSm.classList.toggle('side-nav');
    });
}


{
    /* Notification Modal */
    const notifyButton = document.querySelector('#notificationModalButton');
    const closeNotifyButton = document.querySelector('.close-modal');
    if (notifyButton) {
        notifyButton.addEventListener('click', () => {
            document.querySelector('#notificationModal').style.display = 'block';
        });

        closeNotifyButton.addEventListener('click', () => {
            document.querySelector('#notificationModal').style.display = 'none';
        });
    }

    window.addEventListener('click', (event) => {
        if (event.target == document.querySelector('#notificationModal')) {
            document.querySelector('#notificationModal').style.display = 'none';
        }
    });
    /* Notification Modal */
}

{
    window.onload = function() {

        function get(url) {
            return new Promise(function(resolve, reject) {
                var xhttp = new XMLHttpRequest();
                xhttp.open('GET', url, true);
                xhttp.onload = function() {
                    if (xhttp.status == 200) {
                        resolve(JSON.parse(xhttp.response));
                    } else {
                        reject(xhttp.statusText);
                    }
                };
                xhttp.onerror = function() {
                    reject(xhttp.statusText);
                }
                xhttp.send();
            });
        }

        var promise = get('https://api.paystack.co/bank');
        promise.then((data) => {
            var res = data;
            console.log(res);
            var banks = res.data;
            console.log(banks);
            var content = '';
            for (var i in banks) {
                content += `<option>${banks[i].name}</option>`;

            }
            $('#bankNames').append(content);
            console.log(content);
        }).catch((err) => {
            console.log(err);
        });

        // var http = new XMLHttpRequest();

        // http.onreadystatechange = function() {
        //     if (http.readyState == 4 && http.status == 200) {
        //         console.log(JSON.parse(http.response));
        //     }
        // }

        // http.open('GET', 'https://api.paystack.co/bank', true);
        // http.send();
        // console.log(http);
    }
}

function dashboardModal() {
    console.log('hello');
    /* dashboard Modal */
    const dashboardModalButton = document.querySelectorAll('.dashboard-modal-button', '#dashboardModalButton');
    const closedashboardModal = document.querySelector('.close-dashboard-modal');
    document.querySelector('.dashboard-modal').style.display = 'block';
    console.log('hello');
    // dashboardModalButton.forEach(dashboardButton => dashboardButton.addEventListener('click', () => {
    //     document.querySelector('.dashboard-modal').style.display = 'block';
    // }));
    // dashboardModalButtonSingle.addEventListener('click', () => {
    //     document.querySelector('.dashboard-modal').style.display = 'block';
    // });
    closedashboardModal.addEventListener('click', () => {
        document.querySelector('.dashboard-modal').style.display = 'none';
    });

    window.addEventListener('click', (event) => {
        if (event.target == document.querySelector('.dashboard-modal')) {
            document.querySelector('.dashboard-modal').style.display = 'none';
        }
    });
    /* dashboard Modal */
}
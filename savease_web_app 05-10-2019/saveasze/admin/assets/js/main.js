{
    /* side menu dropdown*/
    function showDropdown() {
        document.getElementById('dropDown1').classList.toggle('side-list-dropdown-menu-show')
    };

    function showDropdown2() {
        document.getElementById('dropDown2').classList.toggle('side-list-dropdown-menu-show')
    };

    window.onclick = function(event) {
        if (!event.target.matches('side-list-dropdown-toggle')) {
            var dropdowns = document.querySelectorAll("side-list-dropdown-menu");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('side-list-dropdown-menu-show')) {
                    openDropdown.classList.remove('side-list-dropdown-menu-show');
                }
            }
        }
    }

}


{
    // const toggleButton = document.querySelector('.collapseButton');
    // toggleButton.addEventListener('click', () => {
    //     const sideNav = document.querySelector('.side-nav-collapsed');
    //     sideNav.classList.toggle('side-nav');
    // });

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
    /* dashboard Modal */
    const dashboardModalButton = document.querySelectorAll('.dashboard-modal-button', '#dashboardModalButton');
    const closedashboardModal = document.querySelector('.close-dashboard-modal');
    dashboardModalButton.forEach(dashboardButton => dashboardButton.addEventListener('click', () => {
        document.querySelector('.dashboard-modal').style.display = 'block';
    }));
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

{
    const trigger = document.querySelector('#confirmContentButton');
    const confirmModal = document.querySelector('#confirmContent');
    const alertModal = document.querySelector('#statusContent');
    const backButton = document.querySelector('#backButton');
    trigger.addEventListener('click', () => {
        confirmModal.style.display = 'none';
        alertModal.style.display = 'block';
    })
    backButton.addEventListener('click', () => {
        confirmModal.style.display = 'block';
        alertModal.style.display = 'none';
    })
}
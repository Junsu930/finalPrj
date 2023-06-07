document.querySelector('.js-static-modal-toggle').addEventListener('click', function() {
      new Modal({el: document.getElementById('static-modal')}).show();
    });
    
     Modal.templates = {
      header: '<div class="modal-header foo"></div>',
    };
    document.querySelector('.js-static-modal-toggle-main')
      .addEventListener('click', function() {
        new Modal({el: document.getElementById('static-modal')}).show();
      });
    document.querySelector('.js-static-modal-toggle')
      .addEventListener('click', function() {
        new Modal({el: document.getElementById('static-modal')}).show();
      });

    document.querySelector('.js-dynamic-modal-toggle')
      .addEventListener('click', function() {

        // Here we create our dynamic modal
        new Modal({
          title: 'Hooray!',
          content: 'My Very Dynamic Modal Content'
        }).show();

      });

    document.querySelector('.js-alert-modal-toggle')
      .addEventListener('click', function() {

        // Here we create our dynamic modal
        Modal.alert('My Custom Alert').show();

      });

    document.querySelector('.js-confirm-modal-toggle')
      .addEventListener('click', function() {

        // Here we create our dynamic modal
        var cfrm = Modal.confirm('Are you sure?');
        cfrm.on('hide', function() {
          alert('Triggered hide event.');
        });
        cfrm.on('hidden', function() {
          alert('Modal is hidden.');
        });
        cfrm.show();

      });

    document.querySelector('.js-confirm-event-modal-toggle')
      .addEventListener('click', function() {

        // Here we create our dynamic modal
        var confirmModal = Modal.confirm('Are You Sure?');
        confirmModal.show().once('dismiss', function(modal, ev, button) {
          if (button && button.value) {
            alert("You've clicked on an OK button.");
          }
        });

      });
    

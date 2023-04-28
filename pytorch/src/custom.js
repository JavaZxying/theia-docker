define(['base/js/namespace', 'base/js/promises'], function(Jupyter, promises) {
    Jupyter._target = '_self';
    promises.notebook_loaded.then(function() {
        Jupyter.notebook.set_autosave_interval(50000);
    });
  });
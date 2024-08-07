let Hooks = {};

Hooks.VueFlow = {
  mounted() {
    LiveVue.createApp({
      components: {
        VueFlow
      }
    }).mount(this.el);
  }
};

export default Hooks;

import { createApp, h } from 'vue';
import LiveVue from 'live_vue';

let Hooks = {};
Hooks.VueComponent = {
  mounted() {
    const app = createApp({
      render: () => h('router-view'),
    });
    app.use(LiveVue);
    app.mount(this.el);
  },
};

export default Hooks;

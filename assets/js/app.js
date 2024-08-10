import "phoenix_html"
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "topbar"
import { getHooks, initializeVueApp } from "live_vue"
import "../css/app.css"
import components from "../vue"
import { getCurrentInstance } from "vue"
import "vite/modulepreload-polyfill"

// Integrate with PrimeVue
import PrimeVue from 'primevue/config';
import Aura from '@primevue/themes/aura';

const initializeApp = context => {
  const app = initializeVueApp(context)
  app.use(PrimeVue, { theme: { preset: Aura } });
  return app
}

// JavaScript hooks for real-time updates
const Hooks = {
  NodeMove: {
    mounted() {
      // Handle the real-time node movement event
      this.handleEvent("node_moved", ({ node_id, position }) => {
        let nodeElement = document.getElementById(`node_${node_id}`);
        if (nodeElement) {
          nodeElement.style.left = `${position.x}px`;
          nodeElement.style.top = `${position.y}px`;
        }
      });

      this.el.addEventListener("dragend", (event) => {
        let nodeId = this.el.dataset.id;
        let position = { x: event.pageX, y: event.pageY };
        this.pushEvent("move_node", { node_id: nodeId, position: position });
      });
    }
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks, params: { _csrf_token: csrfToken } })

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// Connect if there are any LiveViews on the page
liveSocket.connect()

// Expose liveSocket on window for web console debug logs and latency simulation
window.liveSocket = liveSocket

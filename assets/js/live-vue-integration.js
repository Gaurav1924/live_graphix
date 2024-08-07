import LiveVue from 'live_vue'
import { createApp } from 'vue'

const app = createApp({
    components: {
        LiveVue
    }
})

app.mount('#live-vue')

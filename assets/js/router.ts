import { createRouter, createWebHistory } from 'vue-router';
import BillOfMaterials from '@components/BillOfMaterials.vue';
import GraphComponent from '@components/GraphComponent.vue';

const routes = [
  { path: '/bill-of-materials', component: BillOfMaterials },
  { path: '/graphs', component: GraphComponent },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;

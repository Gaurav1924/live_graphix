<template>
  <div>
    <h1>Graph Component</h1>
    <p>This component uses Vue Flow to create a dynamic and interactive flow diagram. The graph below shows the relationships between multiple nodes, representing various processes or entities within the application.</p>
    
    <vue-flow
      :nodes="nodes"
      :edges="edges"
      :zoom-on-scroll="true"
      :selectable="true"
      style="width: 100%; height: 800px;"
    />

    <div>
      <h2>Graph Details</h2>
      <p>The graph above visualizes the intricate connections between the different nodes. Each node represents a significant entity, and the edges illustrate the relationships between them. This graph is essential for understanding the data flow and dependencies in the system.</p>
      <p>Hovering over a node reveals additional information, and clicking on an edge highlights the connection it represents. The graph is fully interactive, allowing you to explore the relationships between components dynamically.</p>
    </div>
  </div>
</template>

<script>
import { VueFlow } from '@braks/vue-flow';

export default {
  components: { VueFlow },
  props: {
    nodes: {
      type: Array,
      required: true,
    },
    edges: {
      type: Array,
      required: true,
    },
  },
};
</script>

<style scoped>
/* Styling for Graph Component */
h1, h2 {
  color: #333;
  margin-bottom: 10px;
}
p {
  font-size: 16px;
  line-height: 1.5;
}
</style>

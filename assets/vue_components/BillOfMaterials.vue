<template>
  <div>
    <h1>Bill of Materials</h1>
    <p>The Bill of Materials (BOM) is a comprehensive list of items, parts, assemblies, and other materials required to create a product. This component provides detailed information on each item, including its name, quantity, and description.</p>

    <ul>
      <li v-for="item in items" :key="item.id">
        <strong>{{ item.name }}</strong>: {{ item.quantity }}
        <p>{{ item.description }}</p>
      </li>
    </ul>

    <div>
      <h2>Summary</h2>
      <p>The BOM is essential for production planning and inventory management. By keeping track of each component and its required quantity, you can ensure a smooth manufacturing process.</p>
    </div>

    <div>
      <h2>Details</h2>
      <p>Each item listed below plays a crucial role in the final product. The descriptions provide insight into the function and importance of each component.</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    items: {
      type: Array,
      required: true,
    },
  },
};
</script>

<style scoped>
h1, h2 {
  color: #333;
  margin-bottom: 10px;
}
p {
  font-size: 16px;
  line-height: 1.5;
}
ul {
  list-style-type: none;
  padding-left: 0;
}
li {
  margin-bottom: 15px;
}
</style>

<template>
  <div class="app-container">
    <h1>Hi Liana, I am running from within a docker container</h1>
    <button @click="showMessage" class="green-button">Click Me</button>
    <p v-if="message" class="message">{{ message }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: ''
    }
  },
  methods: {
    showMessage() {
      this.message = 'hot reload test 2'
    }
  }
}
</script>

<style>
.app-container {
  text-align: center;
  padding: 2rem;
}

h1 {
  color: #42b983;
  margin-bottom: 1.5rem;
}

.green-button {
  background-color: #42b983;
  color: white;
  border: none;
  padding: 1rem 2rem;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
  transition: background-color 0.2s;
}

.green-button:hover {
  background-color: #38a169;
}

.message {
  margin-top: 1rem;
  color: #42b983;
}
</style>

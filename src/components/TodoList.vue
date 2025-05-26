<template>
  <div class="todo-container">
    <h2>Todo List</h2>
    <div class="todo-input">
      <input
        v-model="newTodo"
        @keyup.enter="addTodo"
        type="text"
        placeholder="Add a new task..."
        class="todo-input-field"
      />
      <button @click="addTodo" class="add-button">Add</button>
    </div>
    <ul class="todo-list">
      <li v-for="(todo, index) in todos" :key="index" class="todo-item">
        <input
          type="checkbox"
          :checked="todo.completed"
          @change="toggleTodo(index)"
          class="todo-checkbox"
        />
        <span :class="{ 'completed': todo.completed }">{{ todo.text }}</span>
        <button @click="removeTodo(index)" class="remove-button">×</button>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newTodo: '',
      todos: []
    }
  },
  methods: {
    addTodo() {
      if (this.newTodo.trim()) {
        this.todos.push({
          text: this.newTodo.trim(),
          completed: false
        })
        this.newTodo = ''
      }
    },
    toggleTodo(index) {
      this.todos[index].completed = !this.todos[index].completed
    },
    removeTodo(index) {
      this.todos.splice(index, 1)
    }
  }
}
</script>

<style scoped>
.todo-container {
  background: #f8fafc;
  padding: 2rem;
  border-radius: 12px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  margin: 2rem 0;
}

.todo-input {
  display: flex;
  gap: 0.5rem;
  margin-bottom: 1.5rem;
}

.todo-input-field {
  flex: 1;
  padding: 0.75rem;
  border: 2px solid #e5e7eb;
  border-radius: 6px;
  font-size: 1rem;
}

.todo-input-field:focus {
  outline: none;
  border-color: #42b983;
}

.add-button {
  background: #42b983;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 6px;
  cursor: pointer;
  font-size: 1rem;
  transition: background-color 0.2s;
}

.add-button:hover {
  background: #38a169;
}

.todo-list {
  list-style: none;
  padding: 0;
}

.todo-item {
  display: flex;
  align-items: center;
  padding: 0.75rem;
  border-bottom: 1px solid #e5e7eb;
}

.todo-item:last-child {
  border-bottom: none;
}

.todo-checkbox {
  margin-right: 1rem;
}

.completed {
  text-decoration: line-through;
  color: #6b7280;
  opacity: 0.7;
  transition: all 0.2s ease;
}

.todo-item {
  display: flex;
  align-items: center;
  padding: 0.75rem;
  border-bottom: 1px solid #e5e7eb;
  transition: background-color 0.2s;
}

.todo-item:hover {
  background-color: #f8fafc;
}

.todo-item.completed {
  background-color: #f8fafc;
}

.remove-button {
  margin-left: auto;
  background: none;
  border: none;
  color: #dc2626;
  font-size: 1.25rem;
  cursor: pointer;
}

.remove-button:hover {
  color: #b91c1c;
}
</style>

import { createRouter, createWebHistory } from 'vue-router'

import Welcome from '../views/Welcome'
// import Register_url from '../views/register-url'

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router

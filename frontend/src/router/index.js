import { createRouter, createWebHistory } from 'vue-router'

import Welcome from '../views/Welcome'
import Urls from '../views/Urls'
// import Register_url from '../views/register-url'

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome
  },
  {
    path: '/urls',
    name: 'Urls',
    component: Urls
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router

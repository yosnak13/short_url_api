<template>
  <div>
    <h1>全ての登録済みURL</h1>
    <p>URLs:</p>
    <p>{{ urls }}</p>
    <button type="submit" @click="fetchUrls()">URL全件取得</button>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  name: 'Urls',
    data: () => ({
      urls: []
    }),
  methods: {
    fetchUrls(){
      axios
      .get('http://localhost:3000/urls')
      .then(response => {
        this.urls = response.data;
      })
      .catch(error => {
        console.error(error);
      });
    }
  }
}
</script>

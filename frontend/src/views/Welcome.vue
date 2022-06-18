<template>
  <div>
    <h1>{{ title }}</h1>
    <!-- <p v-if='isEnabled'>{{ subtitle }}</p>
    <button @dblclick='toggle'>トグルする</button>
    <p>{{ text }}</p> -->
    <TestComponent @toggle="toggle" message='コンポーネントにデータが渡されています' />
    <p v-if="isEnabled">こんにちは</p>
  </div>
</template>
<script>
import TestComponent from '../components/TestComponent.vue'

export default {
  components: {
    TestComponent
  },
  data(){
    // データプロパティを記述
    return {
      title: '初めてのVue.jsアプリです！',
      subtitle: 'ようこそ',
      isEnabled: true
    }
  },
  computed: {
    // 算出プロパティ(計算機能がついているプロパティのこと)
    text(){
      if(this.isEnabled){
        return 'こんにちは！'
      } else {
        return 'さようなら！'
      }
    }
  },
  methods: {
    // JSのメソッドを記述
    toggle(){
      this.isEnabled = !this.isEnabled
    }
  }
}
</script>
<style scoped>
  p {
    font-size: 20px;
    color: red;
  }
</style>

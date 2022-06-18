<template>
  <div>
    <h1>{{ title }}</h1>
    <p v-if='isEnabled'>{{ subtitle }}</p>
    <button @dblclick='toggle'>トグルする</button>
    <p>{{ text }}</p>
  </div>
</template>
<script>
export default {
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

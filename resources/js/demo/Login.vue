<template>
 <h1>User Page {{fullname_user}}</h1>
 <h1>User Page {{fullname_user2}}</h1>
<Button @click="changeName()">nut</Button>
</template>
<script>
import {mapActions, mapGetters, mapMutations} from 'vuex'

    export default {
        computed: {
            ...mapGetters({
                fullname_user: 'user/fullName',
                fullname_user2: 'user/fullName2',
            })
        },
        methods: {
            ...mapActions('user',['changeNameUser']),
            ...mapMutations('user', ['CHANGE_FULLNAME', 'CHANGE_FULLNAME2']),

            changeName(){
                // this.CHANGE_FULLNAME('test 3')
                // this.CHANGE_FULLNAME2('f')
                this.changeNameUser('test console')
            }
        }

    }
</script>

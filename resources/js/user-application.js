import './bootstrap';

import {createApp} from 'vue';
import UserApp from "./UserApp.vue";
import userRouter from "./user-router";
import store from "./store-users";

import PrimeVue from 'primevue/config';
import 'primevue/resources/themes/saga-blue/theme.css'
import 'primeicons/primeicons.css'
import 'prismjs/themes/prism-coy.css';
import 'primeflex/primeflex.css';
import 'primevue/resources/primevue.css'
import ToastService from 'primevue/toastservice';


import Button from "primevue/button";
import InputText from "primevue/inputtext";
import PanelMenu from 'primevue/panelmenu';
import Card from 'primevue/card';
import Breadcrumb from 'primevue/breadcrumb';
import Dropdown from 'primevue/dropdown';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';     //optional for column grouping
import Row from 'primevue/row';                     //optional for row
import Toolbar from "primevue/toolbar";
import Dialog from "primevue/dialog";
import RadioButton from 'primevue/radiobutton';
import Calendar from 'primevue/calendar';
import Password from 'primevue/password';
import Checkbox from 'primevue/checkbox';
import Image from 'primevue/image';
import FileUpload from 'primevue/fileupload';
import Menubar from 'primevue/menubar';
import Carousel from 'primevue/carousel';
import InputNumber from 'primevue/inputnumber';
import Toast from 'primevue/toast';

import UserLayout from './layouts/User.vue'
import BlankLayout from './layouts/Blank.vue'

const app = createApp(UserApp).use(userRouter).use(store).use(PrimeVue).use(ToastService);

app.component('user-layout', UserLayout)
app.component('blank-layout', BlankLayout)

app.mount('#userApp');

app.component('Dialog', Dialog);
app.component('Button', Button);
app.component('Card', Card);
app.component('InputText', InputText);
app.component('PanelMenu', PanelMenu);
app.component('Breadcrumb', Breadcrumb);
app.component('Menubar', Menubar);
app.component('Dropdown', Dropdown);
app.component('DataTable', DataTable);
app.component('Column', Column);
app.component('ColumnGroup', ColumnGroup);
app.component('Toolbar', Toolbar);
app.component('RadioButton', RadioButton);
app.component('Calendar', Calendar);
app.component('Password', Password);
app.component('Row', Row);
app.component('Checkbox', Checkbox);
app.component('Image', Image);
app.component('FileUpload', FileUpload);
app.component('InputNumber', InputNumber);
app.component('Toast', Toast);




export default app









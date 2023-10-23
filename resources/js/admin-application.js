import {createApp} from "vue";
import AdminRouter from "./admin-router";
import store from "./store-admins";
import AdminApp from './AdminApp.vue';
import PrimeVue from 'primevue/config';
import 'primevue/resources/themes/saga-blue/theme.css'       //theme

import 'primeicons/primeicons.css'
import 'prismjs/themes/prism-coy.css';
import 'primeflex/primeflex.css';
import 'primevue/resources/primevue.css'
import axios from "axios";

import Button from "primevue/button";
import InputText from "primevue/inputtext";
import PanelMenu from 'primevue/panelmenu';
import Card from 'primevue/card';
import Breadcrumb from 'primevue/breadcrumb';
import Menubar from 'primevue/menubar';
import Dropdown from 'primevue/dropdown';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';     //optional for column grouping
import Row from 'primevue/row';                     //optional for row
import Toolbar from "primevue/toolbar";
import Dialog from "primevue/dialog";
import RadioButton from 'primevue/radiobutton';
import Calendar from 'primevue/calendar';
import Checkbox from 'primevue/checkbox';
import Toast from 'primevue/toast';
import InputNumber from 'primevue/inputnumber';
import ConfirmDialog from 'primevue/confirmdialog';
import FileUpload from 'primevue/fileupload';
import TreeTable from 'primevue/treetable';
import MultiSelect from 'primevue/multiselect';

import StyleClass from 'primevue/styleclass';
import Ripple from 'primevue/ripple';
import ToastService from 'primevue/toastservice';
import ConfirmationService from 'primevue/confirmationservice';


import AdminLayout from './layouts/Admin.vue';
import BlankLayout from './layouts/Blank.vue';


const app = createApp(AdminApp).use(AdminRouter).use(store).use(PrimeVue).use(ToastService).use(ConfirmationService);
app.mount('#adminApp');
app.config.globalProperties.$axios = axios

app.component('admin-layout', AdminLayout);
app.component('blank-layout', BlankLayout);

app.component('InputText', InputText);
app.component('Button', Button);
app.component('PanelMenu', PanelMenu);
app.component('Card', Card);
app.component('Breadcrumb', Breadcrumb);
app.component('Menubar', Menubar);
app.component('Dropdown', Dropdown);
app.component('DataTable', DataTable);
app.component('Column', Column);
app.component('ColumnGroup', ColumnGroup);
app.component('Row', Row);
app.component('Toolbar', Toolbar);
app.component('Dialog', Dialog);
app.component('RadioButton', RadioButton);
app.component('Calendar', Calendar);
app.component('Checkbox', Checkbox);
app.component('Toast', Toast);
app.component('ConfirmDialog', ConfirmDialog);
app.component('InputNumber', InputNumber);
app.component('FileUpload', FileUpload);
app.component('TreeTable', TreeTable);
app.component('MultiSelect', MultiSelect);

app.directive('styleclass', StyleClass);
app.directive('ripple', Ripple);
export default app;


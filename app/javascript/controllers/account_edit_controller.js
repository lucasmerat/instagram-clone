import ApplicationController from './application_controller'

export default class extends ApplicationController {
  submit (e) {
    console.log('this is a controller', e);
    e.preventDefault()
    this.stimulate('AccountReflex#submit');
  }
}
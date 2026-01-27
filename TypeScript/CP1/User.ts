class User {
  private _name: string;
  private _login: string;
  private _password: string;
  private _grade: number;
  static count: number = 0;

  constructor(name: string, login: string, password: string, grade: number) {
    this._name = name;
    this._login = login;
    this._password = password;
    this._grade = grade;
    User.count++;
  }


  get name(): string {
    return this._name;
  }

  set name(value: string) {
    this._name = value;
  }

 
  get login(): string {
    return this._login;
  }

  set login(value: string) {
    console.log("Невозможно изменить логин!");
  }


  get password(): string {
    return "********";
  }

  set password(value: string) {
    this._password = value;
  }

 
  get grade(): string {
    return "Неизвестное свойство grade";
  }

  set grade(value: number) {
    console.log("Неизвестное свойство grade");
  }

  showInfo(): void {
    console.log(`Name: ${this._name}, Login: ${this._login}`);
  }

 
  eq(other: User): boolean {
    return this._grade === other._grade;
  }

  lt(other: User): boolean {
    return this._grade < other._grade;
  }

  gt(other: User): boolean {
    return this._grade > other._grade;
  }
}

class SuperUser extends User {
  private _role: string;
  static count: number = 0;

  constructor(name: string, login: string, password: string, role: string, grade: number) {
    super(name, login, password, grade);
    this._role = role;
    SuperUser.count++;
  }

  
  get role(): string {
    return this._role;
  }

  set role(value: string) {
    this._role = value;
  }

  override showInfo(): void {
    console.log(`Name: ${this.name}, Login: ${this.login}, Role: ${this._role}`);
  }
}

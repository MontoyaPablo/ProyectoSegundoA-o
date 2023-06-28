export interface loginModel {
    email: string;
    password: string;
  }

  export interface AuthResData {
    user_id?: string;
    email: string;
    name?: string;
    username: string;
    token?: string;
    is_admin?: boolean;
  }
  export class User {
    constructor(
      public id?: string,
      public email?: string,
      public username?: string,
      public name?: string,
      public token?: string,
      public is_admin?: boolean
    ) {}
  }
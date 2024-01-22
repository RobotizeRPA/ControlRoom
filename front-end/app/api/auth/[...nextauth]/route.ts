
import NextAuth, { NextAuthOptions } from "next-auth";
import CredentialsProvider  from "next-auth/providers/credentials";

const handler = NextAuth({
    // const authOptions: NextAuthOptions = NextAuth({
    providers: [
        CredentialsProvider({
            name: 'credentials',
            credentials: {
                email: {label: 'email', type: 'text'},
                password: { label:'password',type: 'password'}
            },
            async authorize(credentials) {
                if(!credentials?.email || !credentials.password){
                    throw new Error('Invalid credentials')
                }
                
                if(credentials.email !== process.env.USUARIO_ADMIN || credentials.password !== process.env.PASSWORD_ADMIN){
                    throw new Error('Invalid credentials')
                }
                else {
                    const user = {id: "1",name: 'Robotize', email: 'soporte@robotizerpa.com'}
                    return user
                }
            }
        })

    ],
    session: {
        strategy: 'jwt',
        maxAge: 0.5 * 60 * 60
    },
    callbacks: {
        jwt({account,token,user,profile,session}){
            if (user) token.user = user
            return token
        },
        session({session,token}){
            return session
        }
    },
    pages: {
        signIn: '/',
    }
})
// const handler = NextAuth(authOptions);
export { handler as GET, handler as POST}
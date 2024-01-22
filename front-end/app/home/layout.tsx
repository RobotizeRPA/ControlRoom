import { Metadata } from "next"


export const metadata: Metadata = {
    title: 'Robotize | Home',
}

export default function HomeLayout({children}: {children: React.ReactNode}) {
    return <>{children}</>
}
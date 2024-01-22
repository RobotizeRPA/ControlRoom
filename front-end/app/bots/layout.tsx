import { Metadata } from "next"

export const metadata: Metadata = {
    title: 'Robotize | Bots View',
}

export default function ViewLayout({children}: {children: React.ReactNode}) {
    return <>{children}</>
}
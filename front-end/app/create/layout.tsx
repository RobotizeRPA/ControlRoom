import { Metadata } from "next"


export const metadata: Metadata = {
    title: 'Robotize | Create',
}

export default function CreateLayout({children}: {children: React.ReactNode}) {
    return <>{children}</>
}
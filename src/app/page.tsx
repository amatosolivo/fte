import BuildInfo from '@/components/BuildInfo';

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div className="z-10 max-w-5xl w-full items-center justify-between font-mono text-sm">
        <h1 className="text-4xl font-bold text-center mb-8">
          Next.js + Vite + SemVer + RQID
        </h1>
        
        <div className="mb-8">
          <BuildInfo />
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div className="bg-white dark:bg-gray-900 p-6 rounded-lg shadow-md">
            <h2 className="text-xl font-semibold mb-4">🚀 Features</h2>
            <ul className="space-y-2">
              <li>✅ Next.js 14+ with App Router</li>
              <li>✅ Vite integration</li>
              <li>✅ Automatic SemVer</li>
              <li>✅ RQID tracking</li>
              <li>✅ Auto-generated CHANGELOG</li>
              <li>✅ Conventional Commits</li>
            </ul>
          </div>

          <div className="bg-white dark:bg-gray-900 p-6 rounded-lg shadow-md">
            <h2 className="text-xl font-semibold mb-4">📋 Commands</h2>
            <div className="space-y-2 text-sm">
              <code className="block bg-gray-100 dark:bg-gray-800 p-2 rounded">
                npm run release:patch
              </code>
              <code className="block bg-gray-100 dark:bg-gray-800 p-2 rounded">
                npm run release:minor
              </code>
              <code className="block bg-gray-100 dark:bg-gray-800 p-2 rounded">
                npm run release:major
              </code>
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}
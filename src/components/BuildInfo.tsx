'use client'

interface BuildInfoProps {
  className?: string;
}

export default function BuildInfo({ className = '' }: BuildInfoProps) {
  const buildInfo = {
    rqid: process.env.RQID || 'local-dev',
    buildNumber: process.env.BUILD_NUMBER || '0',
    version: process.env.npm_package_version || '0.0.0',
    environment: process.env.NODE_ENV || 'development'
  };

  return (
    <div className={`bg-gray-100 dark:bg-gray-800 p-4 rounded-lg text-sm ${className}`}>
      <h3 className="font-semibold mb-2">Build Information</h3>
      <ul className="space-y-1">
        <li><strong>RQID:</strong> {buildInfo.rqid}</li>
        <li><strong>Build:</strong> #{buildInfo.buildNumber}</li>
        <li><strong>Version:</strong> v{buildInfo.version}</li>
        <li><strong>Environment:</strong> {buildInfo.environment}</li>
      </ul>
    </div>
  );
}
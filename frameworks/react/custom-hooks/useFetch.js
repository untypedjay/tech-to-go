import { useState, useEffect } from 'react';

export const useFetch = url => {
	const [data, setData] = useState(null);
	const [loading, setLoading] = useState(true);

	useEffect(async () => {
		const response = await fetch(url);
		const data = await response.json();
		setData(data);
		setLoading(false);
	}, [url]);
	
	return { data, loading };
};

// usage
const { data, loading } = useFetch(url);

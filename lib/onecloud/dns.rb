# frozen_string_literal: true

module Onecloud
  # Operations with DNS
  # TODO: Rename to 'Domains'
  module DNS
    # List of all domains
    def domains
      # TODO: alias: all_dns, dns, dns_list
      get('Dns')
    end

    # Domain by ID
    def domain_by_id(domain_id)
      get("Dns/#{domain_id}")
    end

    # Create new domain
    def add_domain(params)
      post('dns', params)
    end

    # Delete domain by ID
    def remove_domain(domain_id)
      delete("dns/#{domain_id}")
    end

    # Create A type record
    def add_domain_record_a(params)
      post('dns/recorda', params)
    end

    # Create AAAA type record
    def add_domain_record_aaaa(params)
      post('dns/recordaaaa', params)
    end

    # Create CNAME type record
    def add_domain_record_cname(params)
      post('dns/recordcname', params)
    end

    # Create MX type record
    def add_domain_record_mx(params)
      post('dns/recordmx', params)
    end

    # Create NS type record
    def add_domain_record_ns(params)
      post('dns/recordns', params)
    end

    # Create TXT type record
    def add_domain_record_txt(params)
      post('dns/recordtxt', params)
    end

    # Remove record for domain by his ID
    def remove_domain_record(domain_id, record_id)
      delete("dns/#{domain_id}/#{record_id}")
    end

    # Create SRV type record
    def add_domain_record_srv(params)
      post('dns/recordsrv', params)
    end
  end
end

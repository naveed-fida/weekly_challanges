class Translation
  TRANSLATIONS = { AUG: 'Methionine', UUU: 'Phenylalanine', UUC: 'Phenylalanine',
                   UUA: 'Leucine', UUG: 'Leucine', UCU: 'Serine', UCC: 'Serine',
                   UCA: 'Serine', UCG: 'Serine', UAU: 'Tyrosine', UAC: 'Tyrosine',
                   UGU: 'Cysteine', UGC: 'Cysteine', UGG: 'Tryptophan', UAA: 'STOP',
                   UAG: 'STOP', UGA: 'STOP' }

  def self.of_codon(codon)
    raise InvalidCodonError unless TRANSLATIONS.keys.include?(codon.to_sym)
    TRANSLATIONS[codon.to_sym]
  end

  def self.of_rna(rna)
    proteins = []
    codons = rna.chars.each_slice(3).map(&:join)
    codons.each do |codon|
      break if TRANSLATIONS[codon.to_sym] == 'STOP'
      proteins << of_codon(codon)
    end
    proteins
  end

  class InvalidCodonError < RuntimeError
  end
end
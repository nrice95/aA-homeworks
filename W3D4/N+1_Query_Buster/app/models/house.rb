class House < ApplicationRecord
  has_many :gardeners,
    class_name: 'Gardener',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    through: :gardeners,
    source: :plants

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    # TODO: your code here
    plants = self.plants.includes(:seeds)

    plants.reduce(Array.new()) do |acc,plant|
      acc += plant.seeds
    end
  end

  # def joins_seeds_query
  #   plants = self
  #     .plants
  #     .select("plants.*, ALL(seeds.*) as all_seeds")
  #     .joins(:seeds)seeds_count
  #     .group("plants.id")
  #     # .order("seeds.id ASC")
  #
  #   # plants.reduce(Array.new()) do |acc,plant|
  #   #   acc += plant.seeds
  #   # end
  #   # result = []
  #   # plants.each {|plant| result += plant.seeds}
  #   # result
  #   plants.map do |plant|
  #     [plant.id,plant.all_seeds]
  #    # `#comments_count` will access the column we `select`ed in the
  #    # query.
  #
  #  end
  # end
end
